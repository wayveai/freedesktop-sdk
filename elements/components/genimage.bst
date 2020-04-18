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
  ref: v12-0-g2d223c273a150afe2937aa3ed7ee812e938d2db8
