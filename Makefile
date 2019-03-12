SHELL=/bin/bash
BRANCH=18.08
ARCH=$(shell uname -m | sed "s/^i.86$$/i686/")
ifeq ($(ARCH),i686)
FLATPAK_ARCH=i386
else
FLATPAK_ARCH=$(ARCH)
endif
REPO=repo
CHECKOUT_ROOT=runtimes

ARCH_OPTS=-o target_arch $(ARCH)

ifeq ($(ARCH),arm)
ABI=gnueabi
else
ABI=gnu
endif

BST=bst --colors $(ARCH_OPTS)

all: build

build:
	$(BST) build flatpak-release.bst public-stacks/buildsystems.bst

export: clean-runtime
	$(BST) build flatpak-release.bst

	mkdir -p $(CHECKOUT_ROOT)
	$(BST) checkout --hardlinks "flatpak-release.bst" $(CHECKOUT_ROOT)

	test -e $(REPO) || ostree init --repo=$(REPO) --mode=archive

	flatpak build-commit-from --src-repo=$(CHECKOUT_ROOT) $(REPO)

	rm -rf $(CHECKOUT_ROOT)

$(REPO): export

check-dev-files:
	$(BST) build desktop-platform-image.bst

	mkdir -p $(CHECKOUT_ROOT)
	bst --colors $(ARCH_OPTS) checkout --hardlinks desktop-platform-image.bst $(CHECKOUT_ROOT)/$(ARCH)-desktop-platform-image
	./utils/scan-for-dev-files.sh $(CHECKOUT_ROOT)/$(ARCH)-desktop-platform-image | sort -u >found_dev_files.txt
	rm -rf $(CHECKOUT_ROOT)/$(ARCH)-desktop-platform-image

	set -e; if [ -s found_dev_files.txt ]; then \
	  echo "Found development files:" 1>&2; \
	  cat found_dev_files.txt 1>&2; \
	  false; \
	fi

check-rpath:
	$(BST) build desktop-platform-image.bst
	mkdir -p $(CHECKOUT_ROOT)
	$(BST) checkout --hardlinks desktop-platform-image.bst $(CHECKOUT_ROOT)/$(ARCH)-desktop-platform-image
	./utils/find-rpath.sh $(FLATPAK_ARCH)-linux-$(ABI) $(CHECKOUT_ROOT)/$(ARCH)-desktop-platform-image
	rm -rf $(CHECKOUT_ROOT)/$(ARCH)-desktop-platform-image

manifest:
	rm -rf sdk-manifest/
	rm -rf platform-manifest/

	$(BST) build platform-manifest.bst
	$(BST) build sdk-manifest.bst

	$(BST) checkout platform-manifest.bst platform-manifest/
	$(BST) checkout sdk-manifest.bst sdk-manifest/

markdown-manifest: manifest
	python3 utils/jsontomd.py platform-manifest/usr/manifest.json
	python3 utils/jsontomd.py sdk-manifest/usr/manifest.json

test-apps: export XDG_DATA_HOME=$(CURDIR)/runtime
test-apps: $(REPO)
	echo $(XDG_DATA_HOME)
	mkdir -p runtime
	flatpak remote-add --if-not-exists --user --no-gpg-verify fdo-sdk-test-repo $(REPO)
	flatpak install -y --arch=$(FLATPAK_ARCH) --user fdo-sdk-test-repo org.freedesktop.{Platform,Sdk{,.Extension.rust-stable}}//$(BRANCH)
	flatpak list

	flatpak-builder --arch=$(FLATPAK_ARCH) --force-clean app tests/org.flatpak.Hello.json
	flatpak-builder --arch=$(FLATPAK_ARCH) --run app tests/org.flatpak.Hello.json hello

	flatpak-builder --arch=$(FLATPAK_ARCH) --force-clean app tests/org.gnu.Hello.json
	flatpak-builder --arch=$(FLATPAK_ARCH) --run app tests/org.gnu.Hello.json hello

	flatpak-builder --arch=$(FLATPAK_ARCH) --force-clean app tests/org.flatpak.Rust.Hello.json
	flatpak-builder --arch=$(FLATPAK_ARCH) --run app tests/org.flatpak.Rust.Hello.json hello

	flatpak-builder --arch=$(FLATPAK_ARCH) --force-clean app tests/org.flatpak.Readline.json

clean-repo:
	rm -rf $(REPO)

clean-runtime:
	rm -rf $(CHECKOUT_ROOT)

clean-test:
	rm -rf app/
	rm -rf .flatpak-builder/
	rm -rf runtime/

clean: clean-repo clean-runtime clean-test


.PHONY: build check-dev-files clean clean-test clean-repo clean-runtime \
        export test-apps manifest markdown-manifest check-rpath
