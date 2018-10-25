kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: extensions/rust/rust.bst
  type: build
- filename: extensions/rust/cargo.bst
  type: build
- filename: desktop/vala.bst
  type: build
- filename: desktop/gdk-pixbuf.bst
- filename: desktop/pango.bst
- filename: desktop/cairo.bst
- filename: desktop/libcroco.bst
- filename: base/buildsystem-autotools.bst
  type: build
- filename: desktop/gtk-doc.bst
  type: build
- filename: desktop/gobject-introspection.bst
  type: build

variables:
  conf-local: |
    --enable-gtk-doc \
    --enable-vala

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/librsvg-2.so'

environment:
  PATH: /usr/bin:/usr/lib/sdk/rust/bin

sources:
- kind: tar
  url: https://download.gnome.org/sources/librsvg/2.44/librsvg-2.44.7.tar.xz
  ref: aafd1c651b293bc09305ec9ae558e4fbcd4b9be6e7e27a003d48324af993b23e
