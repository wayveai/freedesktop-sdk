kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/gobject-introspection.bst
- components/gperf.bst

depends:
- bootstrap-import.bst
- components/curl.bst
- components/gcab.bst
- components/gdk-pixbuf.bst
- components/libarchive.bst
- components/json-glib.bst

variables:
  meson-local: >-
    -Dfonts=false
    -Ddep11=false
    -Drpm=false
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
    version-match: '(\d+)_(\d+)_(\d+)'

sources:
- kind: git_tag
  url: github:hughsie/appstream-glib.git
  track: master
  ref: appstream_glib_0_7_18-0-g705e8e2061e9c9ef741792b1de56c6529fb57082
- kind: patch
  path: patches/appstream-glib/appstream-glib-curl.patch
