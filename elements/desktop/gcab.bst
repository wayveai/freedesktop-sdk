kind: meson

depends:
- filename: bootstrap-import.bst
- filename: base/glib.bst
- filename: desktop/gobject-introspection.bst
  type: build
- filename: base/gettext.bst
  type: build
- filename: base/buildsystem-meson.bst
  type: build
- filename: base/git.bst
  type: build
- filename: desktop/vala.bst
  type: build

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libgcab-1.0.so'
  cpe:
    version: '1.0'

variables:
  meson-local: -Ddocs=false

sources:
- kind: git_tag
  url: gnome:gcab.git
  track: master
  ref: v1.2-0-g8484568d2e5b55a87cb6d6925ccb2f655159cf99
