kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: components/atk.bst
- filename: components/at-spi2-atk.bst
- filename: components/cairo.bst
- filename: components/gdk-pixbuf.bst
- filename: components/gobject-introspection.bst
  type: build
- filename: components/gsettings-desktop-schemas.bst
- filename: components/hicolor-icon-theme.bst
- filename: components/libepoxy.bst
- filename: components/libxkbcommon.bst
- filename: components/pango.bst
- filename: components/wayland.bst
- filename: components/wayland-protocols.bst
- filename: components/xorg-lib-xcomposite.bst
- filename: components/xorg-lib-xdamage.bst
- filename: components/xorg-lib-xinerama.bst
- filename: components/xorg-lib-xi.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: components/perl.bst
  type: build
- filename: components/gtk-doc.bst
  type: build

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
        - '%{bindir}/gtk3-*'
        - '%{bindir}/gtk-builder-tool'
        - '%{bindir}/gtk-encode-symbolic-svg'
        - '%{libdir}/libgdk-3.so'
        - '%{libdir}/libgtk-3.so'
        - '%{libdir}/libgailutil-3.so'
        - '%{datadir}/share/icons'
        - '%{datadir}/share/icons/**'

    integration-commands:
    - |
      gtk-query-immodules-3.0 --update-cache

    - |
      gtk-update-icon-cache %{datadir}/icons/hicolor
  cpe:
    product: gtk+

sources:
- kind: git_tag
  url: gnome:gtk.git
  track: gtk-3-24
  ref: 3.24.24-0-gde8329b3ce4b235eac9ddcbb6cd121cc83dd9e74
