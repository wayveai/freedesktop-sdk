kind: meson

depends:
- filename: bootstrap-import.bst
- filename: components/glib.bst
- filename: components/gobject-introspection.bst
  type: build
- filename: public-stacks/buildsystem-meson.bst
  type: build
- filename: components/git-minimal.bst
  type: build
- filename: components/vala.bst
  type: build

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libgcab-1.0.so'

variables:
  meson-local: -Ddocs=false

sources:
- kind: git_tag
  url: gnome:gcab.git
  track: master
  ref: v1.4-0-ge3f0c240eb1a1961f0ff61a83a2c7fafba95abb4
