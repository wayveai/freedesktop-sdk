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
  submodules:
    PCSC-contrib:
      url: debian_salsa:rousseau/PCSC-contrib.git
      checkout: true
    PCSC:
      url: debian_salsa:rousseau/PCSC.git
      checkout: true
