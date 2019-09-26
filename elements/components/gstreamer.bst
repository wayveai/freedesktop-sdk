kind: meson

depends:
- filename: bootstrap-import.bst
- filename: components/glib.bst
- filename: components/gobject-introspection.bst
  type: build
- filename: components/libunwind.bst
- filename: public-stacks/buildsystem-meson.bst
  type: build
- filename: components/flex.bst
  type: build
- filename: components/bison.bst
  type: build
- filename: components/gtk-doc.bst
  type: build

variables:
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
  url: freedesktop:gstreamer/gstreamer
  track: '1.16'
  ref: 1.16.1-0-gde0a7c4bc89a3df7424b808c893ca243629bebef
