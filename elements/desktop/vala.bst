kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: base/glib.bst
- filename: base/flex.bst
  type: build
- filename: base/bison.bst
  type: build
- filename: base/buildsystem-autotools.bst
  type: build
- filename: desktop/libgvc.bst

sources:
- kind: tar
  url: https://download.gnome.org/sources/vala/0.42/vala-0.42.5.tar.xz
  ref: 8c33b4abc0573d364781bbfe54a1668ed34956902e471191a31cf05dc87c6e12
