kind: meson

depends:
- filename: bootstrap-import.bst
- filename: components/gobject-introspection.bst
  type: build
- filename: components/gtk-doc.bst
  type: build
- filename: public-stacks/buildsystem-meson.bst
  type: build

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libatk-1.0.so'

  cpe:
    version: '2.30.0'

sources:
- kind: git_tag
  url: gnome:atk
  track: master
  ref: ATK_2_33_3-0-g57af1951823d6e855e2e37bb345070913449653d
