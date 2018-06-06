BRANCH=unstable
ARCH=$(shell uname -m | sed "s/^i.86$$/i586/")
ifeq ($(ARCH),i586)
FLATPAK_ARCH=i386
else
FLATPAK_ARCH=$(ARCH)
endif
REPO=repo

all: runtime

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
	basesdk-locale				\
	basesdk-docs				\
	baseplatform				\
	baseplatform-locale			\
	rust

ARCH_OPTS=-o target_arch $(ARCH)

RUNTIME_DIRECTORIES=$(addprefix sdk/$(ARCH)-,$(RUNTIMES))

$(RUNTIME_DIRECTORIES): $(BOOTSTRAP_IMAGES)
	cd sdk && bst $(ARCH_OPTS) build all.bst
	cd sdk && bst $(ARCH_OPTS) checkout "$$(basename "$@" | sed "s/^$(ARCH)-//").bst" "$$(basename "$@")"

export: $(RUNTIME_DIRECTORIES)
	for dir in $(RUNTIME_DIRECTORIES); do				 \
	  flatpak build-export --arch=$(FLATPAK_ARCH) --files=files $(REPO) "$${dir}" "$(BRANCH)"; \
	done
	if test "$(ARCH)" = "i586" ; then \
	  flatpak build-commit-from --src-ref=runtime/org.freedesktop.Platform.Compat.$(FLATPAK_ARCH)/$(FLATPAK_ARCH)/$(BRANCH) $(REPO) runtime/org.freedesktop.Platform.Compat.$(FLATPAK_ARCH)/x86_64/$(BRANCH); \
	  flatpak build-commit-from --src-ref=runtime/org.freedesktop.Platform.Compat.$(FLATPAK_ARCH).Debug/$(FLATPAK_ARCH)/$(BRANCH) $(REPO) runtime/org.freedesktop.Platform.Compat.$(FLATPAK_ARCH).Debug/x86_64/$(BRANCH); \
        fi

runtime: $(BOOTSTRAP_IMAGES)
	cd sdk && bst $(ARCH_OPTS) build all.bst

clean-runtime:
	rm -rf $(RUNTIME_DIRECTORIES)

clean: clean-runtime

.PHONY: clean clean-runtime export runtime
