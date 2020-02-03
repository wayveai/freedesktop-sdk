kind: autotools

depends:
- bootstrap-import.bst
- components/xorg-app-xkbcomp.bst

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/xorg-util-macros.bst
- components/libxslt.bst
- components/python3.bst

variables:
  conf-local: |
    --enable-compat-rules \
    --with-xkb-base=/usr/share/X11/xkb \
    --with-xkb-rules-symlink=xorg

sources:
- kind: git_tag
  url: freedesktop:xkeyboard-config/xkeyboard-config.git
  track: master
  ref: xkeyboard-config-2.29-0-gd6ae091fd98fa9317c3bc313c4a025b9564e0ad8
