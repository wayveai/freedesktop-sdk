kind: autotools

depends:
  - filename: bootstrap-import.bst
  - filename: rust/rust.bst
    type: build
  - filename: rust/cargo.bst
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
    url: https://download.gnome.org/sources/librsvg/2.42/librsvg-2.42.4.tar.xz
    ref: 225280a2a69ee4cce6452a1a92d9297cc1b34a8faface2bf2b4b9da48f044de3
