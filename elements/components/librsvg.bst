kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: extensions/rust/rust.bst
  type: build
- filename: components/vala.bst
  type: build
- filename: components/gdk-pixbuf.bst
- filename: components/pango.bst
- filename: components/cairo.bst
- filename: components/libcroco.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: components/gtk-doc.bst
  type: build
- filename: components/gobject-introspection.bst
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
  url: https://download.gnome.org/sources/librsvg/2.44/librsvg-2.44.14.tar.xz
  ref: 6a85a7868639cdd4aa064245cc8e9d864dad8b8e9a4a8031bb09a4796bc4e303
