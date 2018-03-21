kind: meson

depends:
  - filename: base.bst
    type: build
  - filename: desktop/libsoup.bst
  - filename: desktop/json-glib.bst
  - filename: desktop/gdk-pixbuf.bst
  - filename: desktop/gcab.bst
  - filename: desktop/gtk3.bst
  - filename: desktop/wayland-protocols.bst
    type: build
  - filename: desktop/gobject-introspection.bst

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

environment:
  LC_ALL: en_US.UTF-8

public:
  bst:
    split-rules:
      devel:
        (>):
          - "%{libdir}/libappstream-glib.so"
          - "%{libdir}/libappstream-builder.so"

sources:
  - kind: tar
    url: https://people.freedesktop.org/~hughsient/appstream-glib/releases/appstream-glib-0.7.7.tar.xz
    ref: bc979456c4ff6bc7434115ef20718d9f7c79cae5110f15d6fe5fae53a5fe800a
