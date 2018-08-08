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
    url: https://download.gnome.org/sources/librsvg/2.42/librsvg-2.42.6.tar.xz
    ref: 90567a488e3fa3ab1b1c0a8517dae2737940c5634974d1a99bdca3a7b1ff2fae
