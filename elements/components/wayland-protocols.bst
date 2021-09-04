kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: components/wayland.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build

sources:
- kind: git_tag
  url: freedesktop:wayland/wayland-protocols.git
  track: main
  ref: 1.22-0-gb631f502b779006bd5a7938efc950fe74572cf0d
