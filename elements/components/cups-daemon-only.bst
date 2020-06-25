kind: filter

build-depends:
- components/cups-base.bst

runtime-depends:
- components/cups.bst

config:
  exclude:
  - cups-libs
  include-orphans: true
