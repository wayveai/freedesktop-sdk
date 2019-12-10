kind: meson

depends:
- filename: bootstrap-import.bst
  type: build
- filename: base/buildsystem-meson.bst
  type: build

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libpixman-1.so'

sources:
- kind: git
  url: freedesktop:pixman/pixman.git
  ref: pixman-0.38.0-0-g5d2cf8fc2149b9b632aafcde59734a7ea74f2b92
