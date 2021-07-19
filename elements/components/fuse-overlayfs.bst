kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- components/fuse3.bst

sources:
- kind: git_tag
  url: github:containers/fuse-overlayfs.git
  track: main
  ref: v1.6-0-gc0e6cca6c7e86fda365fac20c74b3f828a666657
