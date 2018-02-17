kind: manual
description: Linux kernel configured for use in virtual machines.

depends:
- filename: base.bst
  type: build

variables:
  (?):
  - target_arch == "aarch64":
      kernel_arch: arm64
  - target_arch == "i586":
      kernel_arch: i386
  - target_arch != "aarch64" and target_arch != "i586":
      kernel_arch: '%{arch}'

config:
  configure-commands:
    - make defconfig

  build-commands:
    - make ARCH="%{kernel_arch}" $MAKEFLAGS

  install-commands:
    - mkdir -p "%{install-root}"/boot
    - make INSTALL_PATH="%{install-root}"/boot install
    - make INSTALL_MOD_PATH="%{install-root}" modules_install

public:
  bst:
    integration-commands:
    - |
      if which depmod; then
        cd /usr/lib/modules
        for version in *; do
          depmod -a "$version";
        done
      fi

sources:
  - kind: tar
    url: https://cdn.kernel.org/pub/linux/kernel/v4.x/linux-4.15.tar.xz
    ref: 5a26478906d5005f4f809402e981518d2b8844949199f60c4b6e1f986ca2a769
