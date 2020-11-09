kind: meson

build-depends:
- components/gobject-introspection.bst
- public-stacks/buildsystem-meson.bst
- components/flex.bst
- components/bison.bst
- components/hotdoc.bst

depends:
- bootstrap-import.bst
- components/glib.bst
- components/libunwind.bst

variables:
  libexecdir: "%{libdir}"
  meson-local: >-
    -Dexamples=disabled
    -Dbenchmarks=disabled
    -Dintrospection=enabled
    -Dlibunwind=enabled
    -Dlibdw=enabled
    -Ddbghelp=disabled
    -Dbash-completion=disabled
    -Dpackage-origin="freedesktop-sdk"

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libgstcheck-1.0.so'
        - '%{libdir}/libgstbase-1.0.so'
        - '%{libdir}/libgstnet-1.0.so'
        - '%{libdir}/libgstreamer-1.0.so'
        - '%{libdir}/libgstcontroller-1.0.so'

sources:
- kind: git_tag
  url: freedesktop:gstreamer/gstreamer.git
  track: master
  track-extra:
  - '1.18'
  ref: 1.18.1-0-g29a8099d1d4bd8717c13923e710e92e67e335353
