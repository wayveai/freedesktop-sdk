kind: filter

depends:
  - filename: dependencies/base-sdk-image.bst
    type: build

config:
  exclude:
    - filter
  include-orphans: True
