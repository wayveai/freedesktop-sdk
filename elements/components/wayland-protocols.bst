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
  ref: 1.21-0-g177ff9119da526462e5d35fbfde6c84794913787
