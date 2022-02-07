kind: meson

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-meson.bst
  type: build
- filename: components/glib.bst

sources:
- kind: git_tag
  url: github:flatpak/flatpak-xdg-utils.git
  track: main
  ref: 1.0.4-0-gd7a5ee99f91ccf16f6c04f09c8b41888220cbf18
