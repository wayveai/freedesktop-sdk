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
  ref: 1.4-0-g878912e12ae9864c7b9aca2a61d782f8e1044ffe
