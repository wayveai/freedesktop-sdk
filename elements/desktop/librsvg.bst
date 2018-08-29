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
    url: https://download.gnome.org/sources/librsvg/2.44/librsvg-2.44.0.tar.xz
    ref: d1bc2aea9aedb2a41e6b557015486ef60eb94f80190d07224a81154af9d889ff
