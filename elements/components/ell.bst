kind: autotools

depends:
- bootstrap-import.bst

build-depends:
- public-stacks/buildsystem-autotools.bst

sources:
- kind: git_tag
  url: kernel:libs/ell/ell.git
  track: master
  ref: 0.31-0-g048f01dd9e416ed2cd3f3aebe5a03959f0f4fb0d
