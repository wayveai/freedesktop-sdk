kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/flex.bst

depends:
- components/pcsc-lite.bst
- components/libusb.bst
- components/libfl.bst

variables:
  conf-local: >-
    LEXLIB=""

sources:
- kind: git_tag
  url: debian_salsa:rousseau/ccid.git
  track: master
  ref: 1.4.36-0-g74642f87f9e1a937e807acd3a7d2ef600b8d151c
- kind: git_module
  path: PCSC-contrib
  url: debian_salsa:rousseau/PCSC-contrib.git
  ref: e2809ea5b3795452ec03db5a6194c213f52bd1a1
- kind: git_module
  path: PCSC
  url: debian_salsa:rousseau/PCSC.git
  ref: 7730f6c54d7fb6a910d291e2d48c92d2a5abf688
