kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/bison.bst
- components/flex.bst

depends:
- components/linux-pam.bst
- bootstrap-import.bst

sources:
- kind: git_tag
  url: github:legionus/kbd.git
  track: master
  exclude:
  - '*alpha*'
  - '*beta*'
  - '*rc*'
  ref: v2.5.0-0-gffea17ecc2b64a68724362e18133229dd91bde0e
