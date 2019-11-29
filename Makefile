SHELL=/bin/bash
BRANCH=19.08
ARCH?=$(shell uname -m | sed "s/^i.86$$/i686/" | sed "s/^ppc/powerpc/")
BOOTSTRAP_ARCH?=$(shell uname -m | sed "s/^i.86$$/i686/" | sed "s/^ppc/powerpc/")
ifeq ($(ARCH),i686)
FLATPAK_ARCH=i386
QEMU_ARCH=i386
else ifeq ($(ARCH),powerpc64le)
FLATPAK_ARCH=ppc64le
QEMU_ARCH=ppc64
else
FLATPAK_ARCH=$(ARCH)
QEMU_ARCH=$(ARCH)
endif
REPO=repo
CHECKOUT_ROOT=runtimes
VM_CHECKOUT_ROOT=checkout/$(ARCH)
VM_ARTIFACT_ROOT?=vm/minimal/virt.bst
VM_ARTIFACT_BOOT?=vm/boot/virt.bst
IMPORT_BOOTSTRAP?=false
RUNTIME_VERSION?=master

SNAP_GRADE?=devel
ARCH_OPTS=-o bootstrap_build_arch $(BOOTSTRAP_ARCH) -o target_arch $(ARCH) -o snap_grade $(SNAP_GRADE)
ifeq ($(IMPORT_BOOTSTRAP),true)
ARCH_OPTS+= -o import_bootstrap true
endif
TARBALLS=            \
	sdk          \
	platform
TAR_ELEMENTS=$(addprefix tarballs/,$(addsuffix .bst,$(TARBALLS)))
TAR_CHECKOUT_ROOT=tarballs

ifeq ($(ARCH),arm)
ABI=gnueabi
else
ABI=gnu
endif

BST=bst --colors $(ARCH_OPTS)
QEMU=fakeroot qemu-system-$(QEMU_ARCH)

all: build

build:
	$(BST) build tests/check-platform.bst \
	             flatpak-release.bst \
	             public-stacks/buildsystems.bst \
	             oci/layers/{bootstrap,debug,platform,sdk}.bst

build-tar:
	bst --colors $(ARCH_OPTS) build tarballs/all.bst

bootstrap:
	$(BST) build bootstrap/export-bootstrap.bst
	[ -d bootstrap/ ] || mkdir -p bootstrap/
	$(BST) checkout bootstrap/export-bootstrap.bst bootstrap/$(ARCH)

check-abi:
	REFERENCE=$$(git merge-base origin/$(RUNTIME_VERSION) HEAD) && \
	./utils/buildstream-abi-checker/check-abi --bst-opts="${ARCH_OPTS}" --suppressions=utils/abidiff-suppressions.ini --old=$${REFERENCE} --new=HEAD abi/desktop-abi-image.bst

export: clean-runtime
	$(BST) build flatpak-release.bst public-stacks/flatpak-publish-tools.bst

	mkdir -p $(CHECKOUT_ROOT)
	$(BST) checkout --hardlinks "flatpak-release.bst" $(CHECKOUT_ROOT)

	test -e $(REPO) || ostree init --repo=$(REPO) --mode=archive

	$(BST) shell --mount $(REPO) /mnt/$(REPO) --mount $(CHECKOUT_ROOT) /mnt/$(CHECKOUT_ROOT) public-stacks/flatpak-publish-tools.bst -- flatpak build-commit-from --src-repo=/mnt/$(CHECKOUT_ROOT) /mnt/$(REPO)

	rm -rf $(CHECKOUT_ROOT)

$(REPO): export

export-tar:
	bst --colors $(ARCH_OPTS) build $(TAR_ELEMENTS)

	mkdir -p $(TAR_CHECKOUT_ROOT)
	set -e; for tarball in $(TARBALLS); do \
		dir="$(ARCH)-$${tarball}"; \
		bst --colors $(ARCH_OPTS) checkout --hardlinks "tarballs/$${tarball}.bst" "$(TAR_CHECKOUT_ROOT)/$${dir}"; \
	done

clean-vm:
	rm -rf $(VM_CHECKOUT_ROOT)/$(VM_ARTIFACT_ROOT)
	rm -rf $(VM_CHECKOUT_ROOT)/$(VM_ARTIFACT_BOOT)

$(VM_CHECKOUT_ROOT)/$(VM_ARTIFACT_ROOT):
	$(BST) build $(VM_ARTIFACT_ROOT)
	$(BST) checkout --hardlinks $(VM_ARTIFACT_ROOT) $(VM_CHECKOUT_ROOT)/$(VM_ARTIFACT_ROOT)
$(VM_CHECKOUT_ROOT)/$(VM_ARTIFACT_BOOT):
	$(BST) build $(VM_ARTIFACT_BOOT)
	$(BST) checkout --hardlinks $(VM_ARTIFACT_BOOT) $(VM_CHECKOUT_ROOT)/$(VM_ARTIFACT_BOOT)

build-vm: clean-vm $(VM_CHECKOUT_ROOT)/$(VM_ARTIFACT_ROOT) $(VM_CHECKOUT_ROOT)/$(VM_ARTIFACT_BOOT)

QEMU_COMMON_ARGS= \
	-smp 4 \
	-m 256 \
	-nographic \
	-kernel $(VM_CHECKOUT_ROOT)/$(VM_ARTIFACT_BOOT)/vmlinuz \
	-initrd $(VM_CHECKOUT_ROOT)/$(VM_ARTIFACT_BOOT)/initramfs.gz \
	-virtfs local,id=virtfs,path=$(VM_CHECKOUT_ROOT)/$(VM_ARTIFACT_ROOT),security_model=none,mount_tag=virtfs

QEMU_X86_COMMON_ARGS= \
	$(QEMU_COMMON_ARGS) \
	-enable-kvm \
	-append 'root=virtfs rw rootfstype=9p rootflags=trans=virtio,version=9p2000.L,cache=mmap console=ttyS0'

QEMU_ARM_COMMON_ARGS= \
	$(QEMU_COMMON_ARGS) \
	-machine type=virt \
	-cpu max \
	-append 'root=virtfs rw rootfstype=9p rootflags=trans=virtio,version=9p2000.L,cache=mmap init=/usr/lib/systemd/systemd console=ttyAMA0'

QEMU_AARCH64_ARGS= \
	$(QEMU_ARM_COMMON_ARGS)

QEMU_ARM_ARGS= \
	$(QEMU_ARM_COMMON_ARGS) \
	-machine highmem=off

QEMU_POWERPC64LE_ARGS= \
	$(QEMU_COMMON_ARGS) \
	-machine pseries \
	-append 'root=virtfs rw rootfstype=9p rootflags=trans=virtio,version=9p2000.L,cache=mmap init=/usr/lib/systemd/systemd console=ttyS0'

run-vm: $(VM_CHECKOUT_ROOT)/$(VM_ARTIFACT_BOOT) $(VM_CHECKOUT_ROOT)/$(VM_ARTIFACT_ROOT)
ifeq ($(ARCH),x86_64)
	$(QEMU) $(QEMU_X86_COMMON_ARGS)
else ifeq ($(ARCH),i686)
	$(QEMU) $(QEMU_X86_COMMON_ARGS)
else ifeq ($(ARCH),aarch64)
	$(QEMU) $(QEMU_AARCH64_ARGS)
else ifeq ($(ARCH),arm)
	$(QEMU) $(QEMU_ARM_ARGS)
else ifeq ($(ARCH),powerpc64le)
	$(QEMU) $(QEMU_POWERPC64LE_ARGS)
endif

$(CHECKOUT_ROOT)/$(ARCH)-desktop-platform-image: elements
	$(MAKE) clean-platform
	$(BST) build platform-image.bst

	mkdir -p $(CHECKOUT_ROOT)
	bst --colors $(ARCH_OPTS) checkout --hardlinks platform-image.bst $(CHECKOUT_ROOT)/$(ARCH)-desktop-platform-image

check-dev-files: $(CHECKOUT_ROOT)/$(ARCH)-desktop-platform-image
	./utils/scan-for-dev-files.sh $(CHECKOUT_ROOT)/$(ARCH)-desktop-platform-image | sort -u >found_dev_files.txt

	set -e; if [ -s found_dev_files.txt ]; then \
	  echo "Found development files:" 1>&2; \
	  cat found_dev_files.txt 1>&2; \
	  false; \
	fi

check-rpath: $(CHECKOUT_ROOT)/$(ARCH)-desktop-platform-image
	./utils/find-rpath.sh $(FLATPAK_ARCH)-linux-$(ABI) $(CHECKOUT_ROOT)/$(ARCH)-desktop-platform-image

manifest:
	rm -rf sdk-manifest/
	rm -rf platform-manifest/

	$(BST) build manifests/platform-manifest.bst
	$(BST) build manifests/sdk-manifest.bst

	$(BST) checkout manifests/platform-manifest.bst platform-manifest/
	$(BST) checkout manifests/sdk-manifest.bst sdk-manifest/

markdown-manifest: manifest
	python3 utils/jsontomd.py platform-manifest/usr/manifest.json
	python3 utils/jsontomd.py sdk-manifest/usr/manifest.json

test-apps: export XDG_DATA_HOME=$(CURDIR)/runtime
test-apps: $(REPO)
	echo $(XDG_DATA_HOME)
	mkdir -p runtime
	flatpak remote-add --if-not-exists --user --no-gpg-verify fdo-sdk-test-repo $(REPO)
	flatpak remote-ls --all fdo-sdk-test-repo --columns ref,download-size,installed-size | awk "/$(FLATPAK_ARCH)/ && /$(BRANCH)/"
	flatpak install -y --arch=$(FLATPAK_ARCH) --user fdo-sdk-test-repo org.freedesktop.{Platform,Sdk{,.Extension.rust-stable,.Debug,.Docs,.Locale}}//$(BRANCH)
	flatpak list

	flatpak-builder --arch=$(FLATPAK_ARCH) --force-clean app tests/org.flatpak.Hello.json
	flatpak-builder --arch=$(FLATPAK_ARCH) --run app tests/org.flatpak.Hello.json hello

	flatpak-builder --arch=$(FLATPAK_ARCH) --force-clean app tests/org.gnu.Hello.json
	flatpak-builder --arch=$(FLATPAK_ARCH) --run app tests/org.gnu.Hello.json hello

	flatpak-builder --arch=$(FLATPAK_ARCH) --force-clean app tests/org.flatpak.Rust.Hello.json
	flatpak-builder --arch=$(FLATPAK_ARCH) --run app tests/org.flatpak.Rust.Hello.json hello

	flatpak-builder --arch=$(FLATPAK_ARCH) --force-clean app tests/org.flatpak.Readline.json

	flatpak-builder --arch=$(FLATPAK_ARCH) --force-clean app tests/org.flatpak.ExampleRuntime.json

test-codecs: export XDG_DATA_HOME=$(CURDIR)/runtime
test-codecs: $(REPO)
	flatpak remote-add --if-not-exists --user --no-gpg-verify fdo-sdk-test-repo $(REPO)
	flatpak install -y --arch=$(FLATPAK_ARCH) --user fdo-sdk-test-repo org.freedesktop.{Platform,Sdk}//$(BRANCH)

	flatpak-builder --arch=$(FLATPAK_ARCH) --force-clean --repo=$(REPO) app tests/test.codecs.no-exts.json

	flatpak-builder --arch=$(FLATPAK_ARCH) --force-clean --repo=$(REPO) app tests/test.codecs.ffmpeg-full.json

	# Expect full codecs
	flatpak install -y --arch=$(FLATPAK_ARCH) --user fdo-sdk-test-repo test.codecs.ffmpeg-full
	flatpak run test.codecs.ffmpeg-full

	# Expect default codecs
	flatpak run test.codecs.no-exts

	flatpak uninstall -y --all

clean-repo:
	rm -rf $(REPO)

clean-platform:
	rm -rf $(CHECKOUT_ROOT)/$(ARCH)-desktop-platform-image

clean-runtime:
	rm -rf $(CHECKOUT_ROOT)

clean-test:
	rm -rf app/
	rm -rf .flatpak-builder/
	rm -rf runtime/

clean: clean-repo clean-runtime clean-test clean-vm clean-platform

export-snap:
	bst --colors $(ARCH_OPTS) build "snap-images/images.bst"
	bst --colors $(ARCH_OPTS) checkout "snap-images/images.bst" snap/

export-oci:
	$(BST) build oci/platform-oci.bst \
	             oci/sdk-oci.bst \
	             oci/debug-oci.bst \
	             oci/flatpak-oci.bst
	set -e; \
	for name in platform sdk debug flatpak; do \
	  $(BST) checkout "oci/$${name}-oci.bst" --tar "$${name}-oci.tar"; \
	done

export-docker:
	$(BST) build oci/platform-docker.bst \
	             oci/sdk-docker.bst \
	             oci/debug-docker.bst \
	             oci/flatpak-docker.bst
	set -e; \
	for name in platform sdk debug flatpak; do \
	  $(BST) checkout "oci/$${name}-docker.bst" --tar "$${name}-docker.tar"; \
	done

track-mesa-aco:
	$(BST) track extensions/mesa-aco/mesa-base.bst

.PHONY: \
	build check-dev-files clean clean-test clean-repo clean-runtime \
	export test-apps manifest markdown-manifest check-rpath \
	build-tar export-tar clean-vm build-vm run-vm export-snap \
	export-oci export-docker bootstrap test-codecs \
	track-mesa-aco
