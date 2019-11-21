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
  url: gnome:atk.git
  track: master
  track-extra:
  - gnome-3-32
  match:
  - ATK_*_*[02468]_*
  ref: ATK_2_32_0-0-gfd6a6599bdae09ac0436e7b7225214429c176a19
