BRANCH=manual-rewrite
ARCH=$(shell uname -m | sed "s/^i.86$$/i586/")

all: repo

BOOTSTRAP_IMAGES=					\
	sdk/bootstrap-image-platform-$(ARCH).tar.gz	\
	sdk/bootstrap-image-$(ARCH).tar.gz

$(BOOTSTRAP_IMAGES):
	cd bootstrap && bst -o target_arch $(ARCH) build export.bst
	rm -rf co
	cd bootstrap && bst -o target_arch $(ARCH) checkout export.bst ../co
	mv co/$$(basename "$@") "$@"

bootstrap: $(BOOTSTRAP_IMAGES)

RUNTIMES=					\
	sdk					\
	sdk-debug				\
	platform

RUNTIME_DIRECTORIES=$(addprefix sdk/,$(RUNTIMES))

$(RUNTIME_DIRECTORIES): $(BOOTSTRAP_IMAGES)
	cd sdk && bst -o target_arch $(ARCH) build all.bst
	cd sdk && bst -o target_arch $(ARCH) checkout "$$(basename "$@").bst" "$$(basename "$@")"

repo: $(RUNTIME_DIRECTORIES)
	for dir in $(RUNTIME_DIRECTORIES); do				 \
	  flatpak build-export --files=files repo "$${dir}" "$(BRANCH)"; \
	done

clean-runtime:
	rm -rf $(RUNTIME_DIRECTORIES)

clean-bootstrap:
	rm -f $(BOOTSTRAP_IMAGES)

clean: clean-bootstrap clean-runtime

.PHONY: clean clean-bootstrap clean-runtime
