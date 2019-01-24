kind: meson

depends:
  - filename: bootstrap-import.bst
  - filename: base/buildsystem-meson.bst
    type: build

variables:
  meson-local: |
     -Dshared_library_guard_config=/app/etc/freedesktop.ld.so.blockedlist

sources:
  - kind: git_tag
    url: https://gitlab.com/freedesktop-sdk/shared-library-guard.git
    ref: v19.01.3-0-g3317d2ed52f4cd9c48a98dc26e86046270d19ad0
