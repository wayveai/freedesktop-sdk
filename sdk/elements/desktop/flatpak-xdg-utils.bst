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
    ref: 2baef89211f82857f46867f43c6c86c584ebe346
    track: master
