kind: manual

build-depends:
- components/pkg-config.bst

depends:
- components/systemd.bst

config:
  install-commands:
  - |
    udevdir="$(pkg-config --variable udevdir udev)"
    install -Dm644 -t "%{install-root}${udevdir}/rules.d" *.rules

sources:
- kind: git_tag
  url: github:ValveSoftware/steam-devices
  track: master
  ref: v1.0.0.61-0-g0563be5d6ccda6efa615fd00c46c13f7961a3b5a
