kind: manual
description: GNU linux headers stage 1

depends:
- filename: bootstrap/build/base-sdk.bst
  type: build

(@): elements/bootstrap/include/build.yml

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
  url: tar_https:cdn.kernel.org/pub/linux/kernel/v5.x/linux-5.2.1.tar.xz
  ref: 3581e84e9d63298a14c147f925cd496ebb25c5a08cf065ba63c54cdee6d86506

public:
  bst:
    split-rules:
      devel:
      - /**
