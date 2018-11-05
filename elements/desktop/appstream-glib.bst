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
  type: build
- filename: base/buildsystem-meson.bst
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
        - '%{libdir}/libappstream-glib.so'
        - '%{libdir}/libappstream-builder.so'

sources:
- kind: git_tag
  url: https://github.com/hughsie/appstream-glib
  track: master
  ref: appstream_glib_0_7_14-0-g75a7af1d8870bb0fcf216e788b273a4c41e99cec
