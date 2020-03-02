kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: components/wayland.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build

sources:
- kind: git_tag
  url: freedesktop:wayland/wayland-protocols.git
  track: master
  ref: 1.20-0-gb0a25f26d3e8b5ad24773881a9a895dd9cc75466
