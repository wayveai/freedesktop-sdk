kind: meson

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-meson.bst
  type: build
- filename: components/nasm.bst
  type: build

variables:
  meson-local: >-
    -Denable_tests=false

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libdav1d.so'

sources:
- kind: git_tag
  url: videolan:dav1d.git
  track: master
  ref: 0.5.2-0-g39667c751d427e447cbe8be783cfecd296659e24
