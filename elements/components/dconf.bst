kind: meson

depends:
- bootstrap-import.bst

build-depends:
- public-stacks/buildsystem-meson.bst
- components/vala.bst
- components/dbus.bst

variables:
  meson-local: >
    -Dbash_completion=false
    -Dman=false

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libdconf.so'

sources:
- kind: git_tag
  url: gnome:dconf.git
  track: master
  track-extra:
  - dconf-0.36
  match:
  - 0.[0-9][02468].*
  ref: 0.36.0-0-gb11d5f1e18b1a57fde7e8d1a1c361d5bce0da564
- kind: patch
  path: patches/dconf/dconf-override.patch
