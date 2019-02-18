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
  - target_arch != "aarch64" and target_arch != "i686":
      kernel_arch: '%{arch}'

config:
  install-commands:
  - make ARCH="%{kernel_arch}" INSTALL_HDR_PATH="%{install-root}%{prefix}" headers_install

sources:
- kind: tar
  url: https://cdn.kernel.org/pub/linux/kernel/v4.x/linux-4.14.96.tar.xz
  ref: 110daeae1a416b7e0ec8dce5e86d67552deeb4567f696c3869389be239f0ecb5

public:
  bst:
    split-rules:
      devel:
      - /**
