kind: autotools

depends:
- bootstrap-import.bst

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/flex.bst

sources:
- kind: git_tag
  url: github:martinh/libconfuse.git
  track: master
  ref: v3.3-0-ga42aebf13db33afd575da6e63f55163d371f776d
