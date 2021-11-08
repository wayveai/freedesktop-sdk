kind: filter

build-depends:
- components/dbus-base.bst

runtime-depends:
- bootstrap-import.bst
- components/libdbus.bst

config:
  include:
  - dbus-tools
  include-orphans: false
