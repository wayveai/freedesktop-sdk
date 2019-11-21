kind: meson

depends:
- filename: bootstrap-import.bst
- filename: desktop/libsoup.bst
- filename: desktop/json-glib.bst
- filename: desktop/gdk-pixbuf.bst
- filename: desktop/gcab.bst
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

  cpe:
    version: '0.7.15'

sources:
- kind: git_tag
  url: github:hughsie/appstream-glib.git
  track: master
  ref: appstream_glib_0_7_15-0-g0ab28ff96b74eb72ffe3c3a53026aee82cf31782
