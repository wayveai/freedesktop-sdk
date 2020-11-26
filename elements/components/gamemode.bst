kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/systemd.bst

depends:
- components/dbus.bst
- components/inih.bst

variables:
  meson-local: >-
    -Dwith-pam-group=users
    -Dwith-sd-bus-provider=systemd
    -Dwith-examples=false
    -Dwith-util=true
    -Dwith-daemon=true

config:
  install-commands:
    (>):
    - |
      install -Dm644 -t "%{install-root}%{sysconfdir}" example/gamemode.ini

public:
  bst:
    split-rules:
      devel:
        (>):
        - "%{libdir}/libgamemodeauto.so"
        - "%{libdir}/libgamemode.so"
        - "%{libdir}/libinih.so"
        - "%{libdir}/libINIReader.so"

sources:
- kind: git_tag
  url: github:FeralInteractive/gamemode.git
  track: master
  ref: 1.6-0-g5f71f57db105c5d8682d5ab795651245603133ff
