kind: script

build-depends:
- snap-images/squashfs-tools.bst
- snap-images/glxinfo.bst

config:
  layout:
  - element: snap-images/squashfs-tools.bst
    destination: '/'
  - element: snap-images/glxinfo.bst
    destination: '%{build-root}'

(@):
- elements/snap-images/snap-common.yml

variables:
  snap-target: glxinfo.snap
