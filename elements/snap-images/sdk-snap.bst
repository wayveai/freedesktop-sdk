kind: script

build-depends:
- snap-images/squashfs-tools.bst
- snap-images/sdk.bst

config:
  layout:
  - element: snap-images/squashfs-tools.bst
    destination: '/'
  - element: snap-images/sdk.bst
    destination: '%{build-root}'

(@):
- elements/snap-images/snap-common.yml

variables:
  snap-target: sdk.snap
