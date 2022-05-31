kind: script

build-depends:
- snap-images/squashfs-tools.bst
- snap-images/clinfo.bst

config:
  layout:
  - element: snap-images/squashfs-tools.bst
    destination: '/'
  - element: snap-images/clinfo.bst
    destination: '%{build-root}'

(@):
- elements/snap-images/snap-common.yml

variables:
  snap-target: clinfo.snap