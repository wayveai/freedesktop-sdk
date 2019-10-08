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
  - '*.*[13579].*'
  ref: 3.34.0-0-g56d24d47b9699ac6c877b93ae0e863f178c17dab
