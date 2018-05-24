kind: manual
description: GNU linux headers stage 1

depends:
- filename: dependencies/base-sdk.bst
  type: build

variables:
  (?):
    - target_arch == "aarch64":
        kernel_arch: arm64
    - target_arch == "i586":
        kernel_arch: i386
    - target_arch != "aarch64" and target_arch != "i586":
        kernel_arch: "%{target_arch}"

config:
  install-commands:
  - make ARCH="%{kernel_arch}" INSTALL_HDR_PATH="%{install-root}%{sysroot}%{prefix}" headers_install

sources:
- kind: tar
  url: https://cdn.kernel.org/pub/linux/kernel/v4.x/linux-4.13.8.tar.xz
  ref: 64e68ca8223c65282d4fc16e0839f2fa7629b151cb6874aeb19dc8c4ef23f427

public:
  bst:
    split-rules:
      devel:
        - "/**"
