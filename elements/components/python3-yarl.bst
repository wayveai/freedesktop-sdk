kind: pip

depends:
- components/python3.bst

build-depends:
- components/python3-pip.bst

runtime-depends:
- components/python3-idna.bst
- components/python3-multidict.bst

environment:
  YARL_NO_EXTENSIONS: '1'

sources:
- kind: git_tag
  url: github:aio-libs/yarl.git
  track: master
  ref: v1.4.1-0-g8218ec7602b844f6a2a6d268cb66f67db60ddaf4
