kind: meson

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-meson.bst
  type: build
- filename: components/vala.bst
  type: build
- filename: components/dbus.bst
  type: build

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
  - dconf-0.32
  match:
  - 0.[0-9][02468].*
  ref: 0.34.0-0-g22d49c42cc71435e1ece14a385286e1d414ff21b
- kind: patch
  path: patches/dconf/dconf-override.patch
