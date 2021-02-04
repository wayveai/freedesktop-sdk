kind: script

build-depends:
- components/u-boot-qemu.bst
- bootstrap-import.bst

config:
  commands:
  - install -Dm644 -t "%{install-root}" %{datadir}/u-boot/*/u-boot.elf
