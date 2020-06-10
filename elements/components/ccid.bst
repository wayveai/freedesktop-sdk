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
  url: https://salsa.debian.org/rousseau/ccid.git
  track: master
  ref: ccid-1.4.32-0-g8f33a2ff60919f579ee17012e91f927491ef70be
  submodules:
    PCSC-contrib:
      url: https://salsa.debian.org/rousseau/PCSC-contrib.git
      checkout: true
    PCSC:
      url: https://salsa.debian.org/rousseau/PCSC.git
      checkout: true
