kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst

depends:
- components/glib.bst
- components/systemd.bst
- components/libgudev.bst

variables:
  meson-local: >-
    -Dtests=disabled

sources:
- kind: git_tag
  url: github:linuxwacom/libwacom.git
  track: master
  ref: libwacom-2.3.0-0-gb88053851ef81694b9e3927e0857f0f02ff9a8a8
