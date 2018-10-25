kind: meson

depends:
- filename: bootstrap-import.bst
- filename: desktop/wayland-protocols.bst
- filename: desktop/xorg-data-xkeyboard-config.bst
- filename: base/buildsystem-meson.bst
  type: build
- filename: base/bison.bst
  type: build

variables:
  meson-local: |
    -Denable-docs=false \
    -Denable-x11=true

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libxkbcommon.so'
        - '%{libdir}/libxkbcommon-x11.so'

sources:
- kind: git
  url: https://github.com/xkbcommon/libxkbcommon.git
  track: master
  ref: b82e3b764e60df337ca695e8f8642e7bf42b0cca   #  xkbcommon-0.8.0
