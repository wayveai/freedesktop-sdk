kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: components/libunwind.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build

variables:
  conf-local: --enable-mpers=check

sources:
- kind: git_tag
  url: github:strace/strace.git
  track: master
  ref: v5.12-0-g91465b47e1e61c07dcd559e781ae34b99c519bee
