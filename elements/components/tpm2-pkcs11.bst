kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/git-minimal.bst

depends:
- components/libyaml.bst
- components/tpm2-tools.bst
- components/sqlite.bst

sources:
- kind: git_tag
  url: github:tpm2-software/tpm2-pkcs11.git
  track: master
  exclude:
  - '*rc*'
  ref: 1.7.0-0-g7a04ae8d3b4b2e2b8a7036607928db765dd33333
