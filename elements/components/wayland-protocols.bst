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
  ref: 1.23-0-gcd153943618bcf157896a6d0f1154d0ad62078a7
