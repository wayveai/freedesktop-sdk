kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: desktop/wayland-protocols.bst
  type: build
- filename: desktop/atk.bst
- filename: desktop/at-spi2-atk.bst
- filename: desktop/pango.bst
- filename: desktop/cairo.bst
- filename: desktop/dconf.bst
  type: runtime
- filename: desktop/gdk-pixbuf.bst
- filename: desktop/gobject-introspection.bst
  type: build
- filename: desktop/gsettings-desktop-schemas.bst
- filename: desktop/hicolor-icon-theme.bst
- filename: desktop/xorg-lib-xinerama.bst
- filename: desktop/xorg-lib-xi.bst
- filename: desktop/xorg-lib-xcomposite.bst
- filename: desktop/xorg-lib-xdamage.bst
- filename: desktop/libxkbcommon.bst
- filename: desktop/libepoxy.bst
- filename: desktop/mesa.bst
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
  url: gnome:gtk
  track: gtk-3-24
  ref: 3.24.2-1-g2905fc861acda3d134a198e56ef2f6c962ad3061
