kind: meson

depends:
- filename: bootstrap-import.bst
- filename: base/buildsystem-meson.bst
  type: build
- filename: base/gettext.bst
  type: build
- filename: desktop/gobject-introspection.bst
  type: build

config:
  install-commands:
    (>):
    - rm -r "%{install-root}%{libexecdir}/installed-tests"
    - rm -r "%{install-root}%{datadir}/installed-tests"

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libjson-glib-1.0.so'

sources:
- kind: git_tag
  url: gnome:json-glib.git
  track: json-glib-1-4
  ref: 1.4.4-0-g700a8bc414991d35ff3f79607547d4beedac8629
