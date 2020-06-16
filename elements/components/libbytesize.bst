kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- components/mpfr.bst
- components/pcre2.bst
- components/python3.bst

sources:
- kind: git_tag
  url: github:storaged-project/libbytesize.git
  track: master
  ref: 2.3-0-g96aba1e99aa40a21df980bac4f2ed3bd1e25dbde
