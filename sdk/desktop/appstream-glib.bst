kind: meson

depends:
  - filename: bootstrap-import.bst
  - filename: desktop/libsoup.bst
  - filename: desktop/json-glib.bst
  - filename: desktop/gdk-pixbuf.bst
  - filename: desktop/gcab.bst
  - filename: desktop/gtk3.bst
  - filename: desktop/wayland-protocols.bst
    type: build
  - filename: desktop/gobject-introspection.bst
  - filename: base/meson.bst
    type: build
  - filename: base/ninja.bst
    type: build
  - filename: base/pkg-config.bst
    type: build
  - filename: base/gperf.bst
    type: build
  - filename: base/gettext.bst
    type: build
  - filename: base/libarchive.bst

variables:
  meson-local: |
    -Dfonts=false \
    -Ddep11=false \
    -Drpm=false \
    -Dstemmer=false

config:
  install-commands:
    (>):
      - |
        rm -r "%{install-root}%{datadir}/installed-tests"

public:
  bst:
    split-rules:
      devel:
        (>):
          - "%{libdir}/libappstream-glib.so"
          - "%{libdir}/libappstream-builder.so"

sources:
  - kind: tar
    url: https://people.freedesktop.org/~hughsient/appstream-glib/releases/appstream-glib-0.7.10.tar.xz
    ref: 43453b8cde676b203830e70981e5aff91c7809233eeca96edaf8b73d2d047a21
