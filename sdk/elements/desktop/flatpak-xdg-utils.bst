kind: autotools

depends:
  - filename: base.bst
    type: build

config:
  configure-commands:
    (<):
      - |
        NOCONFIGURE=1 ./autogen.sh

sources:
  - kind: git
    url: https://github.com/flatpak/flatpak-xdg-utils.git
    ref: c2266e2bce9d8f72e3f705e04719c7d9a924fd87
    track: master
