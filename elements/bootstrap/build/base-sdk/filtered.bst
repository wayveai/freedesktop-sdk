kind: filter

depends:
- filename: bootstrap/build/base-sdk/image.bst
  type: build

config:
  exclude:
    - filter
  include-orphans: True
