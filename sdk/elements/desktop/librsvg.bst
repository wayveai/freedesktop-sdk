kind: myautotools

depends:
  - filename: base-stack.bst
    type: build
  - filename: desktop/gdk-pixbuf.bst
  - filename: desktop/pango.bst
  - filename: desktop/cairo.bst
  - filename: desktop/libcroco.bst

public:
  bst:
    split-rules:
      devel:
        - "%{libdir}/librsvg-2.so"

sources:
  # FIXME: 2.41 requires rust
  - kind: tar
    url: https://download.gnome.org/sources/librsvg/2.40/librsvg-2.40.19.tar.xz
    ref: 612b4d8b8609036f5d899be3fe70d9866b5f6ac5c971154c1c0ef7242216c1f7
