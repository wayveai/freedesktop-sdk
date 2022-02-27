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
  ref: 1.5.0-0-gf79106c365ed0747109e7e465adb54bf176b1036
  submodules:
    PCSC-contrib:
      url: https://salsa.debian.org/rousseau/PCSC-contrib.git
      checkout: true
    PCSC:
      url: https://salsa.debian.org/rousseau/PCSC.git
      checkout: true
