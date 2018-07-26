kind: autotools

depends:
  - filename: bootstrap-import.bst
  - filename: base/pkg-config.bst
    type: build
  - filename: desktop/gtk-doc.bst
    type: build
  - filename: base/glib.bst
  - filename: base/autoconf.bst
    type: build
  - filename: base/automake.bst
    type: build
  - filename: base/libtool.bst
    type: build

public:
  bst:
    split-rules:
      devel:
        (>):
          - "%{libdir}/libcroco-0.6.so"

sources:
  - kind: git
    url: https://github.com/GNOME/libcroco
    track: 0.6.12
    ref: 0d0162098ac6630113da9e66620ab29459352dd6  # 0.6.12
