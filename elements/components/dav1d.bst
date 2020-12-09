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
  url: git_https:code.videolan.org/videolan/dav1d.git
  track: master
  ref: 0.8.0-0-g2ca1bfc39fe5c182d885f2750779d5b1678d8ef9
