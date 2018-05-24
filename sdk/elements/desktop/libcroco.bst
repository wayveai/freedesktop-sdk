kind: autotools

depends:
  - filename: bootstrap-import.bst
  - filename: base/pkg-config.bst
    type: build
  - filename: desktop/gtk-doc.bst
    type: build
  - filename: base/glib.bst

public:
  bst:
    split-rules:
      devel:
        (>):
          - "%{libdir}/libcroco-0.6.so"

sources:
  - kind: tar
    url: https://download.gnome.org/sources/libcroco/0.6/libcroco-0.6.12.tar.xz
    ref: ddc4b5546c9fb4280a5017e2707fbd4839034ed1aba5b7d4372212f34f84f860
