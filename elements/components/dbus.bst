kind: filter

build-depends:
- components/dbus-base.bst

runtime-depends:
- components/libdbus.bst

config:
  exclude:
  - dbus-libs
  include-orphans: true
