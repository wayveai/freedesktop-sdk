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
    version-match: '(\d+)_(\d+)_(\d+)'

sources:
- kind: git_tag
  url: gnome:atk
  track: master
  track-extra:
  - gnome-3-34
  match:
  - ATK_*_*[02468]_*
  ref: ATK_2_34_1-0-g633bde11f93ee971ba8902c6fadbc29c121f71af
