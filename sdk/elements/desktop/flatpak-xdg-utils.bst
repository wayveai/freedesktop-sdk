kind: myautotools

depends:
  - filename: base-stack.bst
    type: build

config:
  configure-commands:
    (<):
      - |
        NOCONFIGURE=1 ./autogen.sh

sources:
  - kind: git
    url: https://github.com/flatpak/flatpak-xdg-utils.git
    ref: f8ed903c227b37110fc30bd1233d675f1c93c060
    track: master
