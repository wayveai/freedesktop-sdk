kind: filter

build-depends:
- components/xdg-desktop-portal-base.bst

runtime-depends:
- components/xdg-desktop-portal-manifest.bst
- components/xdg-portal-interfaces.bst

config:
  include-orphans: true
  exclude:
  - interfaces
