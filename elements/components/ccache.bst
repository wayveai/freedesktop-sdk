kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst
- components/asciidoc.bst
- components/git-minimal.bst
- components/perl.bst

depends:
- bootstrap-import.bst
- components/zstd.bst

variables:
  cmake-local: >-
    -DREDIS_STORAGE_BACKEND=OFF

sources:
- kind: git_tag
  url: github:ccache/ccache.git
  track: master
  ref: v4.4-0-g6ac58b50ec7ad402395acba9b1a5fdcbeabf347d
