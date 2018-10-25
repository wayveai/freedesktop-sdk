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
  url: https://download.gnome.org/sources/vala/0.40/vala-0.40.8.tar.xz
  ref: 5c35e087a7054e9f0a514a0c1f1d0a0d7cf68d3e43c1dbeb840f9b0d815c0fa5
