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
  ref: 41.0-0-ga5c0c7d363bcca5b0f3b6283b0a3e05ddc1c83ac
