kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/git-minimal.bst

depends:
- components/tpm2-tss.bst

sources:
- kind: git_tag
  url: github:tpm2-software/tpm2-tools.git
  track: master
  exclude:
  - '*rc*'
  ref: 5.2-0-gebd59ef827f1fc8e0efa43f9cade4d3d7efee59a
