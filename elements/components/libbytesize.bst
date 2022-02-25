kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- components/mpfr.bst
- components/python3.bst

sources:
- kind: git_tag
  url: github:storaged-project/libbytesize.git
  track: master
  ref: 2.6-0-gc9864f4dd03736839f40d225da494cb1eb64e654
