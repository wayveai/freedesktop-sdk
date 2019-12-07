kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: extensions/rust/rust.bst
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
  url: tar_https:download.gnome.org/sources/librsvg/2.44/librsvg-2.44.12.tar.xz
  ref: 66830b093a24262cc9bd2d1c921f6f59133a99893399d79768f7509021b678c0
