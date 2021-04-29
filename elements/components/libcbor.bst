kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst

depends:
- bootstrap-import.bst

sources:
- kind: git_tag
  url: github:PJK/libcbor.git
  track: master
  ref: v0.8.0-0-ge9c4582a3843248065384ca44e315c45af755fa1
