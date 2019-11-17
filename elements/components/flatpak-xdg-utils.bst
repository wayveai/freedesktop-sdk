kind: meson

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-meson.bst
  type: build
- filename: components/glib.bst

sources:
- kind: git_tag
  url: github:flatpak/flatpak-xdg-utils.git
  track: master
  ref: 1.0.1-0-g727e551bb0bf4a4335a9568f0687970c9d483c50
