kind: filter

build-depends:
- components/ostree-base.bst

runtime-depends:
- components/ostree.bst
- components/avahi-gobject.bst

config:
  include:
  - gobject
