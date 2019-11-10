kind: manual

depends:
- bootstrap-import.bst
- components/pulseaudio.bst

config:
  install-commands:
  - |
    install -Dm644 -t "%{install-root}%{indep-libdir}/systemd/user-preset/" pulseaudio.preset

sources:
- kind: local
  path: files/vm/pulseaudio-config
