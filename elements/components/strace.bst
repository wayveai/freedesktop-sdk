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
  ref: v5.3-0-g187016a629463355875c64c9a45fd94f2b44cb50
