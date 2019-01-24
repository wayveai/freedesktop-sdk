kind: meson

depends:
  - filename: bootstrap-import.bst
  - filename: base/buildsystem-meson.bst
    type: build

variables:
  meson-local: |
     -Dshared_library_guard_config='"/app/etc/freedesktop.ld.so.blockedlist"'

sources:
  - kind: git_tag
    url: https://gitlab.com/freedesktop-sdk/shared-library-guard.git
    ref: v19.01.2-0-g891372b97a13ae31c5b962ae2fd7087ceabb0996
