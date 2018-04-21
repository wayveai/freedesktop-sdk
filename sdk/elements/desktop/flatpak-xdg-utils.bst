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
    ref: f3bfa5c0d9aeb35fa72c76bc4be327f69fc25d73
    track: master
