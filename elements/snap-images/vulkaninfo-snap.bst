kind: script

build-depends:
- snap-images/squashfs-tools.bst
- snap-images/vulkaninfo.bst

config:
  layout:
  - element: snap-images/squashfs-tools.bst
    destination: '/'
  - element: snap-images/vulkaninfo.bst
    destination: '%{build-root}'

(@):
- elements/snap-images/snap-common.yml

variables:
  snap-target: vulkaninfo.snap
