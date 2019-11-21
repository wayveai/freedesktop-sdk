kind: meson

depends:
- filename: bootstrap-import.bst
- filename: base/buildsystem-meson.bst
  type: build
- filename: desktop/vala.bst
  type: build
- filename: desktop/dbus.bst
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
  cpe:
    version: '0.30.1'

sources:
- kind: git_tag
  url: gnome:dconf.git
  track: dconf-0.30
  ref: 0.30.1-0-g6eba98fd6fb39aed73836d5468a516c2ed1a2cb8
- kind: patch
  path: patches/dconf/dconf-override.patch
