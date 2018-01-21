kind: autotools

depends:
  - filename: base.bst
    type: build
  - filename: desktop/wayland-protocols.bst
    type: build
  - filename: desktop/atk.bst
  - filename: desktop/at-spi2-atk.bst
  - filename: desktop/pango.bst
  - filename: desktop/cairo.bst
  - filename: desktop/dconf.bst
    type: runtime
  - filename: desktop/gdk-pixbuf.bst
  - filename: desktop/xorg-lib-xinerama.bst
  - filename: desktop/xorg-lib-xi.bst
  - filename: desktop/xorg-lib-xcomposite.bst
  - filename: desktop/xorg-lib-xdamage.bst
  - filename: desktop/libxkbcommon.bst
  - filename: desktop/libepoxy.bst
  - filename: desktop/mesa.bst

variables:
  conf-local: |
      --enable-xkb \
      --enable-xinerama \
      --enable-xrandr \
      --enable-xfixes \
      --enable-xcomposite \
      --enable-xdamage \
      --enable-x11-backend \
      --enable-wayland-backend

public:
  bst:
    split-rules:
      devel:
        (>):
          - "%{bindir}/gtk3-*"
          - "%{bindir}/gtk-builder-tool"
          - "%{bindir}/gtk-encode-symbolic-svg"
          - "%{libdir}/libgdk-3.so"
          - "%{libdir}/libgtk-3.so"
          - "%{libdir}/libgailutil-3.so"

    integration-commands:
      - |
        gtk-query-immodules-3.0 --update-cache

sources:
  - kind: tar
    # gtk+ 3.22.25 requires new wayland-protocols not released yet with support for server side decoration
    url: https://download.gnome.org/sources/gtk+/3.22/gtk+-3.22.26.tar.xz
    ref: 61eef0d320e541976e2dfe445729f12b5ade53050ee9de6184235cb60cd4b967
