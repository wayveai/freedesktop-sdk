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
  ref: v11-0-gdb1291b1c03c0b2fcaa80fadd74224ca2a5a1376
- kind: patch
  path: patches/genimage/use-mke2fs.patch
