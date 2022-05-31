kind: script

build-depends:
- snap-images/squashfs-tools.bst
- snap-images/vainfo.bst

config:
  layout:
  - element: snap-images/squashfs-tools.bst
    destination: '/'
  - element: snap-images/vainfo.bst
    destination: '%{build-root}'

(@):
- elements/snap-images/snap-common.yml

variables:
  snap-target: vainfo.snap
