kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/systemd.bst
- components/flex.bst

depends:
- components/systemd-libs.bst

variables:
  conf-local: >-
    LEXLIB=""

sources:
- kind: git_tag
  url: debian_salsa:rousseau/PCSC.git
  track: master
  ref: 1.9.7-0-g5c45145d34b5e7382e0223477ff22de67ef97c77
