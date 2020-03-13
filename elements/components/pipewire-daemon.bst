kind: filter

build-depends:
- components/pipewire-base.bst

runtime-depends:
- components/pipewire.bst
- components/sbc.bst
- components/jack.bst
- components/bluez.bst
# TODO: Add dependency to rtkit.
#  This however depens on polkit, which depends on mozjs, python2 and libintl.
#  When polkit more sensible dependencies, rtkit should be used.

config:
  include:
  - daemon
  include-orphans: False
