BRANCH=18.08
ARCH=$(shell uname -m | sed "s/^i.86$$/i586/")
ifeq ($(ARCH),i586)
FLATPAK_ARCH=i386
else
FLATPAK_ARCH=$(ARCH)
endif
REPO=repo

ARCH_OPTS=-o target_arch $(ARCH)

RUNTIMES=					\
	sdk					\
	sdk-debug				\
	sdk-docs				\
	sdk-locale				\
	platform				\
	platform-locale				\
	platform-arch-libs			\
	platform-arch-libs-debug		\
	platform-html5				\
	glxinfo					\
	glxinfo-debug				\
	rust
ifeq ($(ARCH),$(filter $(ARCH),i586 x86_64))
  RUNTIMES+=platform-vaapi
endif
RUNTIME_ELEMENTS=$(addprefix flatpak-images/,$(addsuffix .bst,$(RUNTIMES)))

CHECKOUT_ROOT=runtimes


all: build

build:
	bst $(ARCH_OPTS) build all.bst


export:
	bst $(ARCH_OPTS) build $(RUNTIME_ELEMENTS)
	
	mkdir -p $(CHECKOUT_ROOT)
	for runtime in $(RUNTIMES); do \
	  dir="$(ARCH)-$${runtime}"; \
	  bst $(ARCH_OPTS) checkout "flatpak-images/$${runtime}.bst" "$(CHECKOUT_ROOT)/$${dir}"; \
	  flatpak build-export --arch=$(FLATPAK_ARCH) --files=files $(REPO) "$(CHECKOUT_ROOT)/$${dir}" "$(BRANCH)"; \
	done
	
	case "$(RUNTIMES)" in \
	  *platform-arch-libs*) \
	    if test "$(ARCH)" = "i586" ; then \
	      flatpak build-commit-from --src-ref=runtime/org.freedesktop.Platform.Compat.$(FLATPAK_ARCH)/$(FLATPAK_ARCH)/$(BRANCH) $(REPO) runtime/org.freedesktop.Platform.Compat.$(FLATPAK_ARCH)/x86_64/$(BRANCH); \
	      flatpak build-commit-from --src-ref=runtime/org.freedesktop.Platform.Compat.$(FLATPAK_ARCH).Debug/$(FLATPAK_ARCH)/$(BRANCH) $(REPO) runtime/org.freedesktop.Platform.Compat.$(FLATPAK_ARCH).Debug/x86_64/$(BRANCH); \
	    elif test "$(ARCH)" = "arm" ; then \
	      flatpak build-commit-from --src-ref=runtime/org.freedesktop.Platform.Compat.$(FLATPAK_ARCH)/$(FLATPAK_ARCH)/$(BRANCH) $(REPO) runtime/org.freedesktop.Platform.Compat.$(FLATPAK_ARCH)/aarch64/$(BRANCH); \
	      flatpak build-commit-from --src-ref=runtime/org.freedesktop.Platform.Compat.$(FLATPAK_ARCH).Debug/$(FLATPAK_ARCH)/$(BRANCH) $(REPO) runtime/org.freedesktop.Platform.Compat.$(FLATPAK_ARCH).Debug/aarch64/$(BRANCH); \
	    fi \
	esac


check-dev-files:
	bst $(ARCH_OPTS) build desktop-platform-image.bst
	
	mkdir -p $(CHECKOUT_ROOT)
	bst $(ARCH_OPTS) checkout desktop-platform-image.bst $(CHECKOUT_ROOT)/$(ARCH)-desktop-platform-image
	./utils/scan-for-dev-files.sh $(CHECKOUT_ROOT)/$(ARCH)-desktop-platform-image | sort -u >found_so_files.txt
	
	if [ -s found_so_files.txt ]; then \
	  echo "Found development .so files:" 1>&2; \
	  cat found_so_files.txt 1>&2; \
	  false; \
	fi


test-apps: $(REPO)
	flatpak remote-add --if-not-exists --user --no-gpg-verify fdo-sdk-test-repo $(REPO)
	flatpak install -y --arch=$(FLATPAK_ARCH) --user fdo-sdk-test-repo org.freedesktop.{Platform,Sdk{,.Extension.rust-stable}}//$(BRANCH)
	
	flatpak-builder --arch=$(FLATPAK_ARCH) --force-clean app tests/org.flatpak.Hello.json
	flatpak-builder --arch=$(FLATPAK_ARCH) --run app tests/org.flatpak.Hello.json hello.sh
	
	flatpak-builder --arch=$(FLATPAK_ARCH) --force-clean app tests/org.gnu.hello.json
	flatpak-builder --arch=$(FLATPAK_ARCH) --run app tests/org.gnu.hello.json hello
	
	flatpak-builder --arch=$(FLATPAK_ARCH) --force-clean app tests/org.flatpak.Rust.Hello.json
	flatpak-builder --arch=$(FLATPAK_ARCH) --run app tests/org.flatpak.Rust.Hello.json hello


clean-repo:
	rm -rf $(REPO)

clean-runtime:
	rm -rf $(CHECKOUT_ROOT)

clean: clean-repo clean-runtime


.PHONY: build check-dev-files clean clean-repo clean-runtime export test-apps
