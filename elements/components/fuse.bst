kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build

variables:
  autogen: |
    ./makeconf.sh

environment:
  MOUNT_FUSE_PATH: '%{sbindir}'

sources:
- kind: git_tag
  url: github:libfuse/libfuse.git
  track: fuse_2_9_bugfix
  ref: fuse-2.9.9-0-gd04687923194d906fe5ad82dcd546c9807bf15b6
- kind: patch
  path: patches/fuse/fuse-kernel-h-clean-includes.patch
