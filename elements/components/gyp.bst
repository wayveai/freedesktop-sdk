kind: pip

depends:
- bootstrap-import.bst
- components/python3.bst
- components/python3-setuptools.bst

build-depends:
- components/python3-pip.bst

runtime-depends:
- components/ninja.bst

sources:
- kind: git_tag
  url: chromium:external/gyp
  track: master
  track-tags: false
  ref: d6c5dd51dc3a60bf4ff32a5256713690a1a10376
- kind: patch
  path: patches/gyp/fix-gyp-Python-3.10-compatibility.patch
