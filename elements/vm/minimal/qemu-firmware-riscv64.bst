kind: script

build-depends:
- components/opensbi-u-boot.bst
- bootstrap-import.bst

config:
  commands:
  - install -Dm644 -t "%{install-root}" /usr/share/opensbi/lp64/generic/firmware/fw_payload.elf
