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
  url: tar_https:cdn.kernel.org/pub/linux/kernel/v4.x/linux-4.19.26.tar.xz
  ref: bec45f66c94739596f2bbc35e89de7a2cbd407cf63b537970b52ab117db747fc

public:
  bst:
    split-rules:
      devel:
      - /**
