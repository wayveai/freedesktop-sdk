kind: manual

depends:
- filename: bootstrap-import.bst

config:
  install-commands:
  - |
    mkdir -p "%{install-root}%{sysconfdir}"
    install nsswitch.conf "%{install-root}%{sysconfdir}"

sources:
- kind: local
  path: files/nsswitch.conf
