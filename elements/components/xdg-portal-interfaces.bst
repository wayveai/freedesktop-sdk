kind: filter

depends:
- filename: components/xdg-desktop-portal-base.bst
  type: build
- filename: components/xdg-desktop-portal-manifest.bst
  type: runtime

config:
  include:
  - interfaces
