kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: components/gtk-doc.bst
  type: build
- filename: components/glib.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{bindir}/croco-0.6-config'
        - '%{libdir}/libcroco-0.6.so'

sources:
- kind: git_tag
  url: gnome:libcroco.git
  track: master
  ref: 0.6.13-0-g7e15ca6c2c29a4b78367e6efa6195b331a92b2a7
