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
  ref: 1.0.3-0-g9dc027d5bf9a694ce4f066c97d5f75ef612abc32
