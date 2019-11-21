kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: desktop/atk.bst
- filename: desktop/at-spi2-atk.bst
- filename: desktop/cairo.bst
- filename: desktop/dconf.bst
  type: runtime
- filename: desktop/gdk-pixbuf.bst
- filename: desktop/gobject-introspection.bst
  type: build
- filename: desktop/gsettings-desktop-schemas.bst
- filename: desktop/hicolor-icon-theme.bst
- filename: desktop/libepoxy.bst
- filename: desktop/libxkbcommon.bst
- filename: desktop/mesa.bst
- filename: desktop/pango.bst
- filename: desktop/wayland.bst
- filename: desktop/wayland-protocols.bst
- filename: desktop/xorg-lib-xcomposite.bst
- filename: desktop/xorg-lib-xdamage.bst
- filename: desktop/xorg-lib-xinerama.bst
- filename: desktop/xorg-lib-xi.bst
- filename: base/buildsystem-autotools.bst
  type: build
- filename: base/gettext.bst
  type: build
- filename: base/perl.bst
  type: build
- filename: base/which.bst
  type: build
- filename: desktop/gtk-doc.bst
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
  ref: 3.24.5-0-gbf60bf15de4afd426304f9f42618eb95a92c2605
