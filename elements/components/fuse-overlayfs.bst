kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- components/fuse3.bst

sources:
- kind: git_tag
  url: github:containers/fuse-overlayfs.git
  track: main
  ref: v1.9-0-g51592ea406f48faeccab288f65dcba6c4a67cd90
