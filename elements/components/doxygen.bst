kind: cmake

depends:
- bootstrap-import.bst

build-depends:
- public-stacks/buildsystem-cmake.bst
- components/flex.bst
- components/bison.bst

sources:
- kind: git_tag
  url: github:doxygen/doxygen.git
  track: master
  ref: Release_1_9_2-0-gcaa4e3de211fbbef2c3adf58a6bd4c86d0eb7cb8
