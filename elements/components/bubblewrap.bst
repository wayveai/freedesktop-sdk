kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- bootstrap-import.bst
- components/libcap.bst

sources:
- kind: git_tag
  url: github:projectatomic/bubblewrap.git
  track: main
  ref: v0.6.1-0-ga362d3c0ee79097ce2e3fca4ad003f1e96dad472
