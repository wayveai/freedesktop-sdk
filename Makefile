SHELL=/bin/bash
BRANCH=22.08beta
ARCH?=$(shell uname -m | sed "s/^i.86$$/i686/")
BOOTSTRAP_ARCH?=$(shell uname -m | sed "s/^i.86$$/i686/")
ifeq ($(ARCH),i686)
FLATPAK_ARCH=i386
QEMU_ARCH=i386
else ifeq ($(ARCH),ppc64le)
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
RUNTIME_VERSION?=master
ifeq ($(RUNTIME_VERSION),master)
TARGET_BRANCH=master
else
TARGET_BRANCH=release/$(RUNTIME_VERSION)
endif

SNAP_GRADE?=devel
ARCH_OPTS=-o bootstrap_build_arch $(BOOTSTRAP_ARCH) -o target_arch $(ARCH) -o snap_grade $(SNAP_GRADE)
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
QEMU=qemu-system-$(QEMU_ARCH)

all: build

build:
	$(BST) build tests/check-platform.bst \
	             tests/check-sdk.bst \
	             built-components.bst \
	             flatpak-release.bst \
	             public-stacks/buildsystems.bst \
	             oci/layers/{bootstrap,debug,platform,sdk,flatpak}.bst

build-tar:
	$(BST) build $(TAR_ELEMENTS)


bootstrap:
	$(BST) build bootstrap/bootstrap.bst

check-abi:
	$(BST) build tests/check-abi.bst

export: clean-runtime
	$(BST) build flatpak-release.bst

	mkdir -p $(CHECKOUT_ROOT)
	$(BST) checkout --hardlinks "flatpak-release.bst" $(CHECKOUT_ROOT)

	test -e $(REPO) || ostree init --repo=$(REPO) --mode=archive

	flatpak build-commit-from --src-repo=$(CHECKOUT_ROOT) $(REPO)

	rm -rf $(CHECKOUT_ROOT)

$(REPO): export

export-tar: build-tar
	rm -rf $(TAR_CHECKOUT_ROOT)
	mkdir -p $(TAR_CHECKOUT_ROOT)
	set -e; for tarball in $(TARBALLS); do \
		dir="$(ARCH)-$${tarball}"; \
		mkdir -p "$(TAR_CHECKOUT_ROOT)/$${dir}"; \
		$(BST) checkout "tarballs/$${tarball}.bst" --tar - | xz -T0 > "$(TAR_CHECKOUT_ROOT)/$${dir}/freedesktop-$${tarball}-$(ARCH).tar.xz"; \
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

QEMU_PPC64LE_ARGS= \
	$(QEMU_COMMON_ARGS) \
	-machine pseries \
	-append 'root=virtfs rw rootfstype=9p rootflags=trans=virtio,version=9p2000.L,cache=mmap init=/usr/lib/systemd/systemd console=ttyS0'

run-vm: $(VM_CHECKOUT_ROOT)/$(VM_ARTIFACT_BOOT) $(VM_CHECKOUT_ROOT)/$(VM_ARTIFACT_ROOT)
ifeq ($(ARCH),x86_64)
	unshare --map-root-user $(QEMU) $(QEMU_X86_COMMON_ARGS)
else ifeq ($(ARCH),i686)
	unshare --map-root-user $(QEMU) $(QEMU_X86_COMMON_ARGS)
else ifeq ($(ARCH),aarch64)
	unshare --map-root-user $(QEMU) $(QEMU_AARCH64_ARGS)
else ifeq ($(ARCH),arm)
	unshare --map-root-user $(QEMU) $(QEMU_ARM_ARGS)
else ifeq ($(ARCH),ppc64le)
	unshare --map-root-user $(QEMU) $(QEMU_PPC64LE_ARGS)
endif

check-dev-files:
	$(BST) build tests/check-dev-files.bst

check-rpath:
	$(BST) build tests/check-rpath.bst

check-static-libraries:
	$(BST) build tests/check-static-libraries.bst

manifest:
	rm -rf sdk-manifest/
	rm -rf platform-manifest/

	$(BST) build manifests/platform-manifest.bst manifests/sdk-manifest.bst

	$(BST) checkout manifests/platform-manifest.bst platform-manifest/
	$(BST) checkout manifests/sdk-manifest.bst sdk-manifest/

markdown-manifest: manifest
	python3 utils/jsontomd.py platform-manifest/usr/manifest.json
	python3 utils/jsontomd.py sdk-manifest/usr/manifest.json

url-manifest:
	python3 utils/url_manifest.py release-url-manifest/url-manifest-no-mirrors.json \
	  flatpak-release.bst components.bst \
	  components/rust-stage1-x86-64.bst components/rust-stage1-i686.bst components/rust-stage1-aarch64.bst \
	  components/rust-stage1-armv7.bst components/rust-stage1-powerpc64le.bst \
	  oci/layers/flatpak.bst oci/layers/debug.bst oci/layers/platform.bst oci/layers/sdk.bst

test-apps: export XDG_DATA_HOME=$(CURDIR)/runtime
test-apps: $(REPO)
	echo $(XDG_DATA_HOME)
	mkdir -p runtime
	flatpak remote-add --if-not-exists --user --no-gpg-verify fdo-sdk-test-repo $(REPO)
	flatpak remote-ls --all fdo-sdk-test-repo --columns ref,download-size,installed-size | awk "/$(FLATPAK_ARCH)/ && /$(BRANCH)/"
	flatpak install -y --arch=$(FLATPAK_ARCH) --user fdo-sdk-test-repo org.freedesktop.{Platform,Sdk}//$(BRANCH)
	flatpak list

	flatpak-builder --arch=$(FLATPAK_ARCH) --force-clean app tests/org.flatpak.Hello.json
	flatpak-builder --arch=$(FLATPAK_ARCH) --run app tests/org.flatpak.Hello.json hello

	flatpak-builder --arch=$(FLATPAK_ARCH) --force-clean app tests/org.gnu.Hello.json
	flatpak-builder --arch=$(FLATPAK_ARCH) --run app tests/org.gnu.Hello.json hello

	flatpak-builder --arch=$(FLATPAK_ARCH) --force-clean app tests/org.flatpak.Readline.json

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

test-runtime-inheritance: export XDG_DATA_HOME=$(CURDIR)/runtime
test-runtime-inheritance: $(REPO)
	flatpak remote-add --if-not-exists --user --no-gpg-verify fdo-sdk-test-repo $(REPO)
	flatpak install -y --arch=$(FLATPAK_ARCH) --user fdo-sdk-test-repo org.freedesktop.{Platform,Sdk{,.Debug,.Docs,.Locale}}//$(BRANCH)
	flatpak-builder --arch=$(FLATPAK_ARCH) --force-clean app tests/org.flatpak.ExampleRuntime.json


clean-repo:
	rm -rf $(REPO)

clean-runtime:
	rm -rf $(CHECKOUT_ROOT)

clean-test:
	rm -rf app/
	rm -rf .flatpak-builder/
	rm -rf runtime/

clean: clean-repo clean-runtime clean-test clean-vm

export-snap:
	bst --colors $(ARCH_OPTS) build "snap-images/images.bst"
	bst --colors $(ARCH_OPTS) checkout "snap-images/images.bst" snap/

export-oci:
	$(BST) build oci/platform-oci.bst \
	             oci/sdk-oci.bst \
	             oci/debug-oci.bst \
	             oci/flatpak-oci.bst \
	             oci/toolbox-oci.bst
	set -e; \
	for name in platform sdk debug flatpak toolbox; do \
	  $(BST) checkout "oci/$${name}-oci.bst" --tar "$${name}-oci.tar"; \
	done

export-docker:
	$(BST) build oci/platform-docker.bst \
	             oci/sdk-docker.bst \
	             oci/debug-docker.bst \
	             oci/flatpak-docker.bst \
	             oci/toolbox-docker.bst
	set -e; \
	for name in platform sdk debug flatpak toolbox; do \
	  $(BST) checkout "oci/$${name}-docker.bst" --tar "$${name}-docker.tar"; \
	done

track-mesa-git:
	$(BST) track extensions/mesa-git/libdrm.bst
	$(BST) track extensions/mesa-git/mesa.bst

define OSTREE_GPG_CONFIG
Key-Type: DSA
Key-Length: 1024
Subkey-Type: ELG-E
Subkey-Length: 1024
Name-Real: OSTree Freedesktop SDK TEST
Expire-Date: 0
%no-protection
%commit
%echo finished
endef

export OSTREE_GPG_CONFIG
ostree-gpg:
	rm -rf ostree-gpg.tmp
	mkdir ostree-gpg.tmp
	chmod 0700 ostree-gpg.tmp
	echo "$${OSTREE_GPG_CONFIG}" >ostree-gpg.tmp/key-config
	gpg --batch --homedir=ostree-gpg.tmp --generate-key ostree-gpg.tmp/key-config
	gpg --homedir=ostree-gpg.tmp -k --with-colons | sed '/^fpr:/q;d' | cut -d: -f10 >ostree-gpg.tmp/default-id
	mv ostree-gpg.tmp ostree-gpg

files/vm/ostree-config/fdsdk.gpg: ostree-gpg
	gpg --homedir=ostree-gpg --export --armor >"$@"

LOCAL_ADDRESS=$(shell ip route get 1.1.1.1 | cut -d" " -f7)
OSTREE_BRANCH=freedesktop-sdk-$(BRANCH)-$(ARCH)

.PHONY: vulkan-stack-update
vulkan-stack-update:
	test -n "${SDK_VERSION}"
	for name in components/vulkan-icd-loader.bst \
	components/vulkan-headers.bst \
	components/vulkan-validation-layers.bst \
	extensions/vulkaninfo/vulkan-tools.bst \
	components/spirv-headers.bst \
	components/spirv-tools.bst; do \
	sed -ie "s/- sdk-[1-9]\..*/- sdk-${SDK_VERSION}/" elements/$${name}; \
	bst track $${name}; \
	done

ostree-config.yml:
	echo 'ostree-remote-url: "http://$(LOCAL_ADDRESS):8000/"' >"$@.tmp"
	echo 'ostree-branch: "$(OSTREE_BRANCH)"' >>"$@.tmp"
	mv "$@.tmp" "$@"

update-ostree: ostree-gpg ostree-config.yml files/vm/ostree-config/fdsdk.gpg
	env BST="$(BST)" utils/update-repo.sh		\
	  --gpg-homedir=ostree-gpg			\
	  --gpg-sign=$$(cat ostree-gpg/default-id)	\
	  --collection-id=org.freedesktop.Sdk		\
	  ostree-repo vm/minimal-ostree/repo.bst	\
	  $(OSTREE_BRANCH)

ostree-repo:
	$(MAKE) update-ostree

ostree-serve: ostree-repo
	python3 -m http.server 8000 --directory ostree-repo

$(CHECKOUT_ROOT)/ostree-vm-$(ARCH): files/vm/ostree-config/fdsdk.gpg ostree-config.yml ostree-repo
	$(BST) track vm/minimal-ostree/image.bst
	$(BST) build vm/minimal-ostree/image.bst
	$(BST) checkout vm/minimal-ostree/image.bst "$@"

ifeq ($(ARCH),i686)
OVMF_CODE=/usr/share/qemu/edk2-i386-code.fd
OVMF_VARS=/usr/share/qemu/edk2-i386-vars.fd
else ifeq ($(ARCH),x86_64)
OVMF_CODE=/usr/share/qemu/edk2-x86_64-code.fd
OVMF_VARS=/usr/share/qemu/edk2-i386-vars.fd
else ifeq ($(ARCH),aarch64)
OVMF_CODE=/usr/share/qemu/edk2-aarch64-code.fd
OVMF_VARS=/usr/share/qemu/edk2-arm-vars.fd
else ifeq ($(ARCH),arm)
OVMF_CODE=/usr/share/qemu/edk2-arm-code.fd
OVMF_VARS=/usr/share/qemu/edk2-arm-vars.fd
endif

efi_vars.fd: $(OVMF_VARS)
	cp "$<" "$@"

QEMU_EFI_ARGS=								 \
	-enable-kvm -m 2G						 \
	-drive if=pflash,format=raw,unit=0,file=$(OVMF_CODE),readonly=on \
	-drive if=pflash,format=raw,unit=1,file=efi_vars.fd		 \
	-nographic							 \
	-netdev user,id=net1 -device e1000,netdev=net1

run-ostree-vm: $(CHECKOUT_ROOT)/ostree-vm-$(ARCH) efi_vars.fd
	$(QEMU)							\
	    $(QEMU_EFI_ARGS)					\
	    -drive file=$</disk.img,format=raw,media=disk

.PHONY: \
	build check-dev-files clean clean-test clean-repo clean-runtime \
	export test-apps manifest markdown-manifest check-rpath \
	build-tar export-tar clean-vm build-vm run-vm export-snap \
	export-oci export-docker bootstrap test-codecs \
	track-mesa-git update-ostree ostree-serve run-ostree-vm \
	test-runtime-inheritance
