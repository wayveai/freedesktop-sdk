kind: manual

depends:
- filename: bootstrap-import.bst

config:
  install-commands:
  - |
    install -Dm644 nsswitch-bootable.conf "%{install-root}%{sysconfdir}/nsswitch.conf"

sources:
- kind: local
  path: files/nsswitch-bootable.conf
