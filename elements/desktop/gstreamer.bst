kind: meson

depends:
- filename: bootstrap-import.bst
- filename: base/glib.bst
- filename: desktop/gobject-introspection.bst
  type: build
- filename: base/libunwind.bst
- filename: base/buildsystem-meson.bst
  type: build
- filename: base/flex.bst
  type: build
- filename: base/bison.bst
  type: build

variables:
  meson-local: |
    -Ddisable_examples=true

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
- kind: git
  url: freedesktop-old:gstreamer/gstreamer
  track: 1.14
  ref: 3c586dec930c5c253da0cf49e3f3846243f0ecf5   #  1.14.4
  submodules:
    common:
      url: freedesktop-old:gstreamer/common
