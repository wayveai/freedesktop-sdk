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
  ref: v4.4.1-0-g8ba96ed8b76d07dd7035ec27ddc2fb99f2ec5eed
