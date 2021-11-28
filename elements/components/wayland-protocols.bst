kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst


depends:
- bootstrap-import.bst
- components/wayland.bst

sources:
- kind: git_tag
  url: freedesktop:wayland/wayland-protocols.git
  # Tracking disabled due to ABI forward break
  ref: 1.23-0-gcd153943618bcf157896a6d0f1154d0ad62078a7
