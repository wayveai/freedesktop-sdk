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
  track: master
  url: gitlab:freedesktop-sdk/shared-library-guard.git
  ref: v19.04.1-0-gd0d7c745be1ba5462ff1bbe4695fb4bad480ac8d
