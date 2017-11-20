kind: myautotools

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
  conf-extra: |
    --disable-fonts \
    --disable-dep11 \
    --disable-rpm \
    --disable-stemmer \
    --disable-man

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
    url: https://people.freedesktop.org/~hughsient/appstream-glib/releases/appstream-glib-0.7.3.tar.xz
    ref: f0424d1808a4d38e9b20cee3b700671e70aff8b3ce01836b8e80c75769fd54a4
