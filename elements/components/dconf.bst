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
  ref: 0.32.0-0-g7419a726a2dbaca7781cec4eeb65bd1334a523d7
- kind: patch
  path: patches/dconf/dconf-override.patch
- kind: patch
  path: patches/dconf/meson-fix.patch
