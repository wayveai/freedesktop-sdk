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
  url: https://salsa.debian.org/rousseau/PCSC.git
  track: master
  ref: pcsc-1.8.26-0-gb0c2f30c2bfe7f22fe1b985e647c6cb61cc66275
