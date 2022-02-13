kind: autotools

depends:
- bootstrap-import.bst
- components/libconfuse.bst

build-depends:
- public-stacks/buildsystem-autotools.bst

runtime-depends:
- components/e2fsprogs.bst
- components/mtools.bst
- components/dosfstools.bst

sources:
- kind: git_tag
  url: github:pengutronix/genimage.git
  track: master
  ref: v15-0-gec44ae086c705e6f0439e742c5a2e9b8f3d6ca82
