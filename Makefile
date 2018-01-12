BRANCH=unstable
ARCH=$(shell uname -m | sed "s/^i.86$$/i586/")
ifeq ($(ARCH),i586)
FLATPAK_ARCH=i386
else
FLATPAK_ARCH=$(ARCH)
endif

all: repo

BOOTSTRAP_IMAGES=					\
	sdk/bootstrap-image-platform-$(ARCH)		\
	sdk/bootstrap-image-$(ARCH)

sdk/bootstrap-image-$(ARCH):
	cd bootstrap && bst -o target_arch $(ARCH) build bootstrap-with-links.bst
	cd bootstrap && bst -o target_arch $(ARCH) checkout bootstrap-with-links.bst ../sdk/bootstrap-image-$(ARCH)

sdk/bootstrap-image-platform-$(ARCH):
	cd bootstrap && bst -o target_arch $(ARCH) build bootstrap-platform-with-links.bst
	cd bootstrap && bst -o target_arch $(ARCH) checkout bootstrap-platform-with-links.bst ../sdk/bootstrap-image-platform-$(ARCH)

bootstrap: $(BOOTSTRAP_IMAGES)

RUNTIMES=					\
	sdk					\
	sdk-debug				\
	sdk-docs				\
	sdk-locale				\
	platform				\
	platform-locale				\
	platform-arch-libs			\
	platform-arch-libs-debug		\
	glxinfo					\
	glxinfo-debug				\
	basesdk					\
	basesdk-debug				\
	baseplatform


RUNTIME_DIRECTORIES=$(addprefix sdk/$(ARCH)-,$(RUNTIMES))

$(RUNTIME_DIRECTORIES): $(BOOTSTRAP_IMAGES)
	cd sdk && bst -o target_arch $(ARCH) build all.bst
	cd sdk && bst -o target_arch $(ARCH) checkout "$$(basename "$@" | sed "s/^$(ARCH)-//").bst" "$$(basename "$@")"

repo: $(RUNTIME_DIRECTORIES)
	for dir in $(RUNTIME_DIRECTORIES); do				 \
	  flatpak build-export --arch=$(FLATPAK_ARCH) --files=files repo "$${dir}" "$(BRANCH)"; \
	done

export: $(RUNTIME_DIRECTORIES)
	for dir in $(RUNTIME_DIRECTORIES); do				 \
	  flatpak build-export --arch=$(FLATPAK_ARCH) --files=files $(REPO) "$${dir}" "$(BRANCH)"; \
	done
	if test "$(ARCH)" = "i586" ; then \
	  flatpak build-commit-from --src-ref=runtime/org.freedesktop.Platform.Compat.$(FLATPAK_ARCH)/$(FLATPAK_ARCH)/$(BRANCH) $(REPO) runtime/org.freedesktop.Platform.Compat.$(FLATPAK_ARCH)/x86_64/$(BRANCH); \
	  flatpak build-commit-from --src-ref=runtime/org.freedesktop.Platform.Compat.$(FLATPAK_ARCH).Debug/$(FLATPAK_ARCH)/$(BRANCH) $(REPO) runtime/org.freedesktop.Platform.Compat.$(FLATPAK_ARCH).Debug/x86_64/$(BRANCH); \
        fi

runtime: $(BOOTSTRAP_IMAGES)
	cd sdk && bst -o target_arch $(ARCH) build all.bst

clean-runtime:
	rm -rf $(RUNTIME_DIRECTORIES)

clean-bootstrap:
	rm -f $(BOOTSTRAP_IMAGES)

clean: clean-bootstrap clean-runtime

.PHONY: clean clean-bootstrap clean-runtime export runtime bootstrap
