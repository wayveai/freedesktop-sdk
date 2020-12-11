kind: autotools

depends:
- bootstrap-import.bst
- components/sndfile.bst

build-depends:
- public-stacks/buildsystem-autotools.bst

sources:
- kind: git_tag
  url: kernel:bluetooth/sbc.git
  track: master
  ref: 1.5-0-gb2c20a3ecf5ed00f63c94077a9762b505935ede9
