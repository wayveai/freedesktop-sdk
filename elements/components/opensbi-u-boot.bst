kind: make

build-depends:
- bootstrap-import.bst
- components/u-boot-qemu.bst

variables:
  make-args: >-
    O=build-generic
    PLATFORM=generic
    FW_PAYLOAD_PATH="/usr/share/u-boot/qemu-riscv64_smode/u-boot.bin"

config:
  build-commands:
  - |
    make %{make-args}

  install-commands:
  - |
    make -j1 install %{make-args} install_root_dir="%{install-root}%{prefix}"

sources:
- kind: git_tag
  url: github:riscv/opensbi.git
  track: master
  ref: v0.9-0-g234ed8e427f4d92903123199f6590d144e0d9351
- kind: patch
  path: patches/opensbi/no-stack-protector.patch
