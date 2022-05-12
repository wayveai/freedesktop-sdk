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
  ref: 1.9.6-0-gc783224e5109258a17856f9ef90c044093bfc949
