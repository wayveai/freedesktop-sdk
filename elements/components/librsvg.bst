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
  url: https://download.gnome.org/sources/librsvg/2.44/librsvg-2.44.12.tar.xz
  ref: 66830b093a24262cc9bd2d1c921f6f59133a99893399d79768f7509021b678c0
