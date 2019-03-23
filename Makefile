SHELL=/bin/bash
BRANCH=18.08
ARCH?=$(shell uname -m | sed "s/^i.86$$/i686/")
ifeq ($(ARCH),i686)
FLATPAK_ARCH=i386
QEMU_ARCH=i386
else
FLATPAK_ARCH=$(ARCH)
QEMU_ARCH=$(ARCH)
endif
REPO=repo
CHECKOUT_ROOT=runtimes
VM_CHECKOUT_ROOT=checkout/$(ARCH)
VM_ARTIFACT?=vm/minimal-systemd-vm.bst

ARCH_OPTS=-o target_arch $(ARCH)
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
	$(BST) build check-platform.bst \
	             flatpak-release.bst \
	             public-stacks/buildsystems.bst

build-tar:
	bst --colors $(ARCH_OPTS) build tarballs/all.bst

export: clean-runtime
	$(BST) build flatpak-release.bst

	mkdir -p $(CHECKOUT_ROOT)
	$(BST) checkout --hardlinks "flatpak-release.bst" $(CHECKOUT_ROOT)

	test -e $(REPO) || ostree init --repo=$(REPO) --mode=archive

	flatpak build-commit-from --src-repo=$(CHECKOUT_ROOT) $(REPO)

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
	rm -rf $(VM_CHECKOUT_ROOT)/$(VM_ARTIFACT)

$(VM_CHECKOUT_ROOT)/$(VM_ARTIFACT):
	$(BST) build $(VM_ARTIFACT)
	$(BST) checkout --hardlinks $(VM_ARTIFACT) $(VM_CHECKOUT_ROOT)/$(VM_ARTIFACT)

build-vm: clean-vm $(VM_CHECKOUT_ROOT)/$(VM_ARTIFACT)

QEMU_COMMON_ARGS= \
	-smp 4 \
	-m 256 \
	-nographic \
	-kernel $(VM_CHECKOUT_ROOT)/$(VM_ARTIFACT)/boot/vmlinuz \
	-initrd $(VM_CHECKOUT_ROOT)/$(VM_ARTIFACT)/boot/initramfs.gz \
	-virtfs local,id=root9p,path=$(VM_CHECKOUT_ROOT)/$(VM_ARTIFACT),security_model=none,mount_tag=root9p

QEMU_X86_COMMON_ARGS= \
	$(QEMU_COMMON_ARGS) \
	-enable-kvm \
	-append 'root=root9p rw rootfstype=9p rootflags=trans=virtio,version=9p2000.L,cache=mmap init=/usr/lib/systemd/systemd console=ttyS0'

QEMU_ARM_COMMON_ARGS= \
	$(QEMU_COMMON_ARGS) \
	-machine type=virt \
	-cpu max \
	-append 'root=root9p rw rootfstype=9p rootflags=trans=virtio,version=9p2000.L,cache=mmap init=/usr/lib/systemd/systemd console=ttyAMA0'

QEMU_AARCH64_ARGS= \
	$(QEMU_ARM_COMMON_ARGS)

QEMU_ARM_ARGS= \
	$(QEMU_ARM_COMMON_ARGS) \
	-machine highmem=off

run-vm: $(VM_CHECKOUT_ROOT)/$(VM_ARTIFACT)
ifeq ($(ARCH),x86_64)
	$(QEMU) $(QEMU_X86_COMMON_ARGS)
else ifeq ($(ARCH),i686)
	$(QEMU) $(QEMU_X86_COMMON_ARGS)
else ifeq ($(ARCH),aarch64)
	$(QEMU) $(QEMU_AARCH64_ARGS)
else ifeq ($(ARCH),arm)
	$(QEMU) $(QEMU_ARM_ARGS)
endif

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

clean: clean-repo clean-runtime clean-test clean-vm

.PHONY: \
	build check-dev-files clean clean-test clean-repo clean-runtime \
	export test-apps manifest markdown-manifest check-rpath \
	build-tar export-tar clean-vm build-vm run-vm
