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
  url: gnome:gcab
  track: master
  ref: v1.2-0-g8484568d2e5b55a87cb6d6925ccb2f655159cf99
