kind: cmake

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-cmake.bst
  type: build

variables:
  cmake-local: |
    -DBUILD_SHARED_LIBS:BOOL=ON

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libogg.so'

sources:
- kind: git_tag
  url: github:xiph/ogg.git
  track: master
  ref: v1.3.4-0-gbada45718453ac27b56773ae663f7e65112f6a6e
