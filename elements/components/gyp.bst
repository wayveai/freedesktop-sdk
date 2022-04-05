kind: pip

depends:
- bootstrap-import.bst
- components/python3.bst
- components/python3-setuptools.bst
- components/python3-six.bst

build-depends:
- components/python3-pip.bst

runtime-depends:
- components/ninja.bst

sources:
- kind: git_tag
  url: chromium:external/gyp
  track: master
  track-tags: false
  ref: 9ecf45e37677743503342ee4c6a76eaee80e4a7f
