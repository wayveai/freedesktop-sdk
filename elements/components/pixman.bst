kind: meson

depends:
- filename: bootstrap-import.bst
  type: build
- filename: public-stacks/buildsystem-meson.bst
  type: build

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libpixman-1.so'

sources:
- kind: git_tag
  url: freedesktop:pixman/pixman
  track: master
  ref: pixman-0.38.4-0-ge8df10eea9609609568bf4cbc05796594c1b978d
