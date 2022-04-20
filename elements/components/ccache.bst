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
    -DCCACHE_DEV_MODE=OFF

sources:
- kind: git_tag
  url: github:ccache/ccache.git
  track: master
  ref: v4.6-0-g19fb17ce8f3cf44a2de2019028b3449f04766741
