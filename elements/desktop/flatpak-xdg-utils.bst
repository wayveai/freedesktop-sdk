kind: meson

depends:
- filename: bootstrap-import.bst
- filename: base/buildsystem-meson.bst
  type: build
- filename: base/glib.bst

sources:
- kind: git_tag
  url: github:flatpak/flatpak-xdg-utils.git
  track: master
  ref: 1.0.0-0-g5dd17189459ee2b5d32eef2e71d0cfd681db0486
