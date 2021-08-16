kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- components/util-linux-full.bst
- bootstrap-import.bst

sources:
- kind: git_tag
  url: kernel:linux/kernel/git/jaegeuk/f2fs-tools.git
  track: master
  ref: v1.14.0-0-gd41dcbdf46dc3841cd0a0507e6573e38cb6c55bb
