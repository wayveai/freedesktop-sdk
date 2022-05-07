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
  ref: Release_1_9_4-0-g5d15657a55555e6181a7830a5c723af75e7577e2
- kind: patch
  path: patches/doxygen/gcc-12-support.patch
