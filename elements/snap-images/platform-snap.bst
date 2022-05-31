kind: script

build-depends:
- snap-images/squashfs-tools.bst
- snap-images/platform.bst

config:
  layout:
  - element: snap-images/squashfs-tools.bst
    destination: '/'
  - element: snap-images/platform.bst
    destination: '%{build-root}'

(@):
- elements/snap-images/snap-common.yml

variables:
  snap-target: platform.snap
