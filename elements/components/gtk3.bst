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
  match:
  - 3.24.21
  ref: 3.24.21-0-gab4b85f88cf822d6dbb9cda9c4d71fd10a5d3d99
- kind: patch
  path: patches/gtk/0001-gdk-wayland-Look-for-font-settings-in-gsettings-desk.patch
- kind: patch
  path: patches/gtk/0002-gdk-wayland-Use-double-click-drag-threshold-settings.patch
- kind: patch
  path: patches/gtk/0003-gdk-wayland-Mark-matched-settings-from-the-portal-as.patch
- kind: patch
  path: patches/gtk/0004-gdk-wayland-Look-for-font-settings-recursively.patch
- kind: patch
  path: patches/gtk/0005-gdk-wayland-Do-not-use-xdg_wm_base.ping-serials-as-u.patch
