kind: manual
description: GNU linux headers stage 1

depends:
- filename: bootstrap/build/base-sdk.bst
  type: build

(@): elements/bootstrap/build.yml

variables:
  (?):
  - target_arch == "aarch64":
      kernel_arch: arm64
  - target_arch == "i686":
      kernel_arch: i386
  - target_arch == "powerpc64le":
      kernel_arch: powerpc
  - target_arch != "aarch64" and target_arch != "i686" and target_arch != "powerpc64le":
      kernel_arch: '%{arch}'

config:
  install-commands:
  - make ARCH="%{kernel_arch}" INSTALL_HDR_PATH="%{install-root}%{prefix}" headers_install
  - |
    mkdir -p "%{install-root}%{includedir}/%{gcc_triplet}/linux"
    mkdir -p "%{install-root}%{includedir}/%{gcc_triplet}/asm"
    mv "%{install-root}%{includedir}/asm" \
       "%{install-root}%{includedir}/%{gcc_triplet}/"
    mv "%{install-root}%{includedir}/linux/a.out.h" \
       "%{install-root}%{includedir}/%{gcc_triplet}/linux/" || true
    mv "%{install-root}%{includedir}/linux/kvm_para.h" \
       "%{install-root}%{includedir}/%{gcc_triplet}/linux/" || true

sources:
- kind: tar
  url: https://cdn.kernel.org/pub/linux/kernel/v5.x/linux-5.1.1.tar.xz
  ref: a04d991416e780c229d62a11e36aa936f132027ca8d4fa73006cc96caf058ddd

public:
  bst:
    split-rules:
      devel:
      - /**
