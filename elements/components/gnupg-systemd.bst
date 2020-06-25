kind: manual

build-depends:
- components/pkg-config.bst

depends:
- components/systemd.bst

runtime-depends:
- components/gnupg.bst

config:
  install-commands:
  - |
    systemduserunitdir="$(pkg-config --variable systemduserunitdir systemd)"
    install -Dm644 -t "%{install-root}${systemduserunitdir}" doc/examples/systemd-user/gpg-agent*.{service,socket}

(@):
- elements/include/gnupg-source.yml
