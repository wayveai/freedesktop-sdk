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
  ref: v4.5-0-g6eedb905a1a21fc8a6399b030312def2c510560c
