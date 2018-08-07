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
    url: https://download.gnome.org/sources/librsvg/2.42/librsvg-2.42.5.tar.xz
    ref: d4dd51a492a2022c07dec385e22947190fe70410928c471934ff3399f20935ec
