kind: manual

depends:
- bootstrap-import.bst

runtime-depends:
- components/pipewire-daemon.bst
- components/pipewire-jack.bst

config:
  install-commands:
  - |
    install -Dm644 -t "%{install-root}%{indep-libdir}/systemd/user-preset/" pipewire.preset

sources:
- kind: local
  path: files/vm/pipewire-config
