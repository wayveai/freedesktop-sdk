kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/doxygen.bst

depends:
- components/libgcrypt.bst
- components/json-c.bst
- components/curl.bst

sources:
- kind: git_tag
  url: github:tpm2-software/tpm2-tss.git
  track: master
  track-extra:
  - 2.4.x
  exclude:
  - '*rc*'
  ref: 2.4.6-0-ge7824cf41200a5d2721918867c2b4355db5fe02d
