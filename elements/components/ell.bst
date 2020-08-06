kind: autotools

depends:
- bootstrap-import.bst

build-depends:
- public-stacks/buildsystem-autotools.bst

sources:
- kind: git_tag
  url: kernel:libs/ell/ell.git
  track: master
  ref: 0.32-0-g01794be4052276ad81fd5d8c02c7bd3f0ffe3050
