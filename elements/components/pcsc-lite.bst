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
  ref: 1.9.5-0-gd92b5d4fad5dea95ce8d12fac07fe1eec2150ad1
