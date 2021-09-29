kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst
- components/asciidoc.bst
- components/git-minimal.bst
- components/perl.bst

variables:
  cmake-local: >-
    -DREDIS_STORAGE_BACKEND=OFF

depends:
- bootstrap-import.bst
- components/zstd.bst

sources:
- kind: git_tag
  url: github:ccache/ccache.git
  track: master
  ref: v4.4.2-0-g89def7d170f930a4480a132679f6a9e03d972787
