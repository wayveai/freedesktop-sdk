kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: desktop/gtk-doc.bst
  type: build
- filename: base/glib.bst
- filename: base/buildsystem-autotools.bst
  type: build

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libcroco-0.6.so'

sources:
- kind: git_tag
  url: gnome:libcroco.git
  track: master
  ref: 0.6.13-0-g7e15ca6c2c29a4b78367e6efa6195b331a92b2a7
