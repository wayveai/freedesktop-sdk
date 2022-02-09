kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- components/fuse3.bst

sources:
- kind: git_tag
  url: github:containers/fuse-overlayfs.git
  track: main
  ref: v1.8.2-0-gd01bdd73b6bd1ffccaa163ef3e2660e1838305cb
