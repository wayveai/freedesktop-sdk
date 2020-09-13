kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/xorg-proto-xorgproto.bst
- components/xorg-util-macros.bst
- components/wayland-protocols.bst


depends:
- bootstrap-import.bst
- components/nettle.bst
- components/libtirpc.bst
- components/libdrm.bst
- components/dummy-gbm.bst
- components/libepoxy.bst
- components/pixman.bst
- components/xorg-lib-xkbfile.bst
- components/xorg-lib-xfont2.bst
- components/xorg-lib-xdmcp.bst
- components/xorg-lib-xshmfence.bst
- components/xorg-app-xkbcomp.bst
- components/xorg-font-util.bst
- components/wayland.bst
- components/systemd.bst

variables:
  conf-local: >-
    --disable-xvfb
    --disable-xnest
    --disable-xwin
    --enable-glamor
    --enable-xwayland

sources:
- kind: git_tag
  url: freedesktop:xorg/xserver.git
  track: master
  track-extra:
  - server-1.20-branch
  match:
  - xorg-server-*
  exclude:
  - xorg-server-*.99.*
  ref: xorg-server-1.20.8-0-gf84ad082557f9cde6b8faa373eca6a0a89ba7d56
