kind: meson

depends:
- filename: bootstrap-import.bst
- filename: components/libsoup.bst
- filename: components/json-glib.bst
- filename: components/gdk-pixbuf.bst
- filename: components/gcab.bst
- filename: components/gobject-introspection.bst
  type: build
- filename: public-stacks/buildsystem-meson.bst
  type: build
- filename: components/gperf.bst
  type: build
- filename: components/libarchive.bst

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

  cpe:
    version: '0.7.16'

sources:
- kind: git_tag
  url: github:hughsie/appstream-glib
  track: master
  ref: appstream_glib_0_7_16-0-g230e2da082d9754858330c3e262a9d44f816def1
