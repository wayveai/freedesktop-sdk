kind: meson

depends:
- filename: bootstrap-import.bst
- filename: components/gobject-introspection.bst
  type: build
- filename: public-stacks/buildsystem-meson.bst
  type: build

sources:
- kind: git_tag
  url: gnome:gsettings-desktop-schemas.git
  track: master
  exclude:
  - '*alpha*'
  - '*beta*'
  - '*rc*'
  ref: 40.0-0-g330c148978aa865851b0be3dd72f0817cbd94f31
