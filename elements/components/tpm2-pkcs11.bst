kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/git-minimal.bst

depends:
- components/libyaml.bst
- components/python3.bst
- components/python3-cryptography.bst
- components/python3-pyasn1.bst
- components/python3-pyasn1-modules.bst
- components/python3-pyyaml.bst
- components/python3-tpm2-pytss.bst
- components/tpm2-tools.bst
- components/sqlite.bst

sources:
- kind: git_tag
  url: github:tpm2-software/tpm2-pkcs11.git
  track: master
  exclude:
  - '*rc*'
  ref: 1.8.0-0-gad444b3ee5e6ed45582498670eab05a6e0968395
