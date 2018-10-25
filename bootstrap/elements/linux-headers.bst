kind: manual
description: GNU linux headers stage 1

depends:
- filename: dependencies/base-sdk.bst
  type: build

variables:
  (?):
  - target_arch == "aarch64":
      kernel_arch: arm64
  - target_arch == "i686":
      kernel_arch: i386
  - target_arch != "aarch64" and target_arch != "i686":
      kernel_arch: '%{target_arch}'

config:
  install-commands:
  - make ARCH="%{kernel_arch}" INSTALL_HDR_PATH="%{install-root}%{sysroot}%{prefix}"
    headers_install

sources:
- kind: tar
  url: https://cdn.kernel.org/pub/linux/kernel/v4.x/linux-4.14.56.tar.xz
  ref: d4f56cfac6d43a349e6172bf84613f788a8481a54a213261cf591ffd133bc42c

public:
  bst:
    split-rules:
      devel:
      - /**
