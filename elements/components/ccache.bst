kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst
- components/asciidoc.bst
- components/git-minimal.bst

depends:
- bootstrap-import.bst
- components/zstd.bst

sources:
- kind: git_tag
  url: github:ccache/ccache.git
  track: master
  ref: v4.0-0-g7c44b8c45bd6bc185bf5bd5666f36fcac092d917
