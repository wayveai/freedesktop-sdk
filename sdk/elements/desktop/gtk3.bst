kind: myautotools

depends:
  - filename: base-stack.bst
  - filename: desktop/wayland-protocols.bst
  - filename: desktop/atk.bst
  - filename: desktop/at-spi2-atk.bst
  - filename: desktop/pango.bst
  - filename: desktop/cairo.bst
  - filename: desktop/gdk-pixbuf.bst
  - filename: desktop/xorg-lib-xinerama.bst
  - filename: desktop/xorg-lib-xi.bst
  - filename: desktop/xorg-lib-xcomposite.bst
  - filename: desktop/xorg-lib-xdamage.bst
  - filename: desktop/libxkbcommon.bst
  - filename: desktop/libepoxy.bst
  - filename: desktop/mesa.bst

variables:
  conf-extra: |
      --enable-xkb \
      --enable-xinerama \
      --enable-xrandr \
      --enable-xfixes \
      --enable-xcomposite \
      --enable-xdamage \
      --enable-x11-backend \
      --enable-wayland-backend

sources:
  - kind: tar
    # gtk+ 3.22.25 requires new wayland-protocols not released yet with support for server side decoration
    url: https://download.gnome.org/sources/gtk+/3.22/gtk+-3.22.24.tar.xz
    ref: cbb16e4cfc928ab8f5f22f7290616f95f6ebc8c97cc724a2007b07ced833592b
