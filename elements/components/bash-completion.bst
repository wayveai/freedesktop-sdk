kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- bootstrap-import.bst

sources:
- kind: git_tag
  url: github:scop/bash-completion.git
  track: master
  ref: 2.11-0-gb12639a6becec13a0a2c06173ba40fb3bbe972e1
