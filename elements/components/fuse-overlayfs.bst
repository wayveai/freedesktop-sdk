kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- components/fuse3.bst

sources:
- kind: git_tag
  url: github:containers/fuse-overlayfs.git
  track: master
  ref: v1.1.2-0-g323b01f17478aad992dc69e9195d83bb490008d6
