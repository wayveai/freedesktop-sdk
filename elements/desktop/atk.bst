kind: meson

depends:
- filename: bootstrap-import.bst
- filename: desktop/gobject-introspection.bst
  type: build
- filename: desktop/gtk-doc.bst
  type: build
- filename: base/buildsystem-meson.bst
  type: build
- filename: base/gettext.bst
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
  url: gnome:atk.git
  track: master
  ref: ATK_2_30_0-0-g90ed6bd964b8a2b93c7cf3ea018483e437913785
