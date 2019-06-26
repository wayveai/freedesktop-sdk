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
- kind: git_tag
  url: freedesktop:gstreamer/gstreamer
  track: '1.14'
  ref: 1.14.5-0-gf5beb2da840b2432b46c36b9ea54bbe426ffaed8
