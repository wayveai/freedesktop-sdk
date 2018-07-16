kind: autotools

depends:
  - filename: bootstrap-import.bst
  - filename: base/automake.bst
    type: build
  - filename: base/autoconf-archive.bst
    type: build
  - filename: base/gettext.bst
    type: build
  - filename: base/pkg-config.bst
    type: build
  - filename: base/libtool.bst
    type: build
  - filename: base/glib.bst

config:
  configure-commands:
    (<):
      - |
        NOCONFIGURE=1 ./autogen.sh

sources:
  - kind: git
    url: https://github.com/flatpak/flatpak-xdg-utils.git
    ref: a9afa997da8217bd03ece72fd04221d1597acdb3 # 0.1-13-ga9afa99
    track: master
