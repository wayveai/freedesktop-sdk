kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- bootstrap-import.bst
- components/libxml2.bst

sources:
- kind: git_tag
  url: sourceware:libabigail.git
  track: master
  track-tags: true
  ref: libabigail-2.0-0-g7060a0b2675e871e49ff0e17b691113bbe1a7c5d
