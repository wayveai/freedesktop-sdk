kind: autotools

depends:
  - filename: bootstrap-import.bst
  - filename: extensions/rust/rust.bst
    type: build
  - filename: extensions/rust/cargo.bst
    type: build
  - filename: desktop/gdk-pixbuf.bst
  - filename: desktop/pango.bst
  - filename: desktop/cairo.bst
  - filename: desktop/libcroco.bst
  - filename: base/pkg-config.bst
    type: build

public:
  bst:
    split-rules:
      devel:
        (>):
          - "%{libdir}/librsvg-2.so"

environment:
  PATH: "/usr/bin:/usr/lib/sdk/rust/bin"

sources:
  - kind: tar
    url: https://download.gnome.org/sources/librsvg/2.44/librsvg-2.44.1.tar.xz
    ref: 8af2ea5a612a756d3228ec36fbd1cbbd0c35f6bc862886627360ca85a60ba33a
