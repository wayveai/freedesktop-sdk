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
  cpe:
    version: '0.6.12'

sources:
- kind: git_tag
  url: gnome:libcroco
  track: master
  ref: 0.6.12-0-g0d0162098ac6630113da9e66620ab29459352dd6
