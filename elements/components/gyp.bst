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
  ref: 203fee270b606ad8e0e9c2d6314b59eb30369579
