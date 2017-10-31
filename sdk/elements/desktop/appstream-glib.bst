kind: myautotools

depends:
  - filename: base-stack.bst
  - filename: desktop/libsoup.bst
  - filename: desktop/json-glib.bst
  - filename: desktop/gdk-pixbuf.bst
  - filename: desktop/gcab.bst
  - filename: desktop/gtk3.bst
  - filename: desktop/gobject-introspection.bst

variables:
  conf-extra: |
    --disable-fonts \
    --disable-dep11 \
    --disable-rpm \
    --disable-stemmer \
    --disable-man

environment:
  LC_ALL: en_US.UTF-8

sources:
  - kind: tar
    url: https://people.freedesktop.org/~hughsient/appstream-glib/releases/appstream-glib-0.7.3.tar.xz
    ref: f0424d1808a4d38e9b20cee3b700671e70aff8b3ce01836b8e80c75769fd54a4
