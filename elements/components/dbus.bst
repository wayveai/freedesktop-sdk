kind: filter

build-depends:
- components/dbus-base.bst

runtime-depends:
- components/dbus-tools.bst
- components/libapparmor.bst
- components/libdbus.bst

config:
  exclude:
  - dbus-libs
  - dbus-tools
  include-orphans: true
