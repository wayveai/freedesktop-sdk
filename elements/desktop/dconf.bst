kind: meson

depends:
- filename: bootstrap-import.bst
- filename: base/buildsystem-meson.bst
  type: build
- filename: desktop/vala.bst
  type: build

variables:
  conf-local: |
    --disable-static \
    --disable-man

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libdconf.so'

sources:
- kind: git
  url: https://gitlab.gnome.org/GNOME/dconf
  track: master
  ref: fd884c24cf7d9631836c106ed4a895f18d707120   #  0.28.0
- kind: patch
  path: patches/dconf-override.patch
