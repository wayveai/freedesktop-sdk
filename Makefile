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

all: build

build:
	bst --colors $(ARCH_OPTS) build all.bst
	bst --colors $(ARCH_OPTS) build public-stacks/buildsystems.bst


export: clean-runtime
	bst --colors $(ARCH_OPTS) build all.bst

	mkdir -p $(CHECKOUT_ROOT)
	bst --colors $(ARCH_OPTS) checkout --hardlinks "all.bst" $(CHECKOUT_ROOT)

	test -e $(REPO) || ostree init --repo=$(REPO) --mode=archive

	flatpak build-commit-from --src-repo=$(CHECKOUT_ROOT) $(REPO)

	rm -rf $(CHECKOUT_ROOT)


check-dev-files:
	bst --colors $(ARCH_OPTS) build desktop-platform-image.bst

	mkdir -p $(CHECKOUT_ROOT)
	bst --colors $(ARCH_OPTS) checkout --hardlinks desktop-platform-image.bst $(CHECKOUT_ROOT)/$(ARCH)-desktop-platform-image
	./utils/scan-for-dev-files.sh $(CHECKOUT_ROOT)/$(ARCH)-desktop-platform-image | sort -u >found_dev_files.txt
	rm -rf $(CHECKOUT_ROOT)/$(ARCH)-desktop-platform-image

	set -e; if [ -s found_dev_files.txt ]; then \
	  echo "Found development files:" 1>&2; \
	  cat found_dev_files.txt 1>&2; \
	  false; \
	fi

manifest:
	rm -rf sdk-manifest/
	rm -rf platform-manifest/

	bst --colors $(ARCH_OPTS) build platform-manifest.bst
	bst --colors $(ARCH_OPTS) build sdk-manifest.bst

	bst checkout platform-manifest.bst platform-manifest/
	bst checkout sdk-manifest.bst sdk-manifest/

markdown-manifest: manifest
	python3 utils/jsontomd.py platform-manifest/usr/manifest.json
	python3 utils/jsontomd.py sdk-manifest/usr/manifest.json

test-apps: $(REPO)
	flatpak remote-add --if-not-exists --user --no-gpg-verify fdo-sdk-test-repo $(REPO)
	flatpak install -y --arch=$(FLATPAK_ARCH) --user fdo-sdk-test-repo org.freedesktop.{Platform,Sdk{,.Extension.rust-stable}}//$(BRANCH)

	flatpak-builder --arch=$(FLATPAK_ARCH) --force-clean app tests/org.flatpak.Hello.json
	flatpak-builder --arch=$(FLATPAK_ARCH) --run app tests/org.flatpak.Hello.json hello.sh

	flatpak-builder --arch=$(FLATPAK_ARCH) --force-clean app tests/org.gnu.hello.json
	flatpak-builder --arch=$(FLATPAK_ARCH) --run app tests/org.gnu.hello.json hello

	flatpak-builder --arch=$(FLATPAK_ARCH) --force-clean app tests/org.flatpak.Rust.Hello.json
	flatpak-builder --arch=$(FLATPAK_ARCH) --run app tests/org.flatpak.Rust.Hello.json hello

	flatpak-builder --arch=$(FLATPAK_ARCH) --force-clean app tests/org.flatpak.Readline.json

clean-repo:
	rm -rf $(REPO)

clean-runtime:
	rm -rf $(CHECKOUT_ROOT)

clean: clean-repo clean-runtime


.PHONY: build check-dev-files clean clean-repo clean-runtime export test-apps manifest markdown-manifest
