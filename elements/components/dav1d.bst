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
  ref: 0.4.0-0-g5f63e531b9d10a09afe0a6b4875ca4852a7e58c1
