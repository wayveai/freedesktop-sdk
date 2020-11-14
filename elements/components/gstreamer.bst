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
  track: '1.16'
  ref: 1.16.3-0-g570736df6562b2a52a2c22e5061ec93e86f3434d
