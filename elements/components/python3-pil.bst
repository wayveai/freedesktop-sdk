kind: pip

build-depends:
- components/python3-pip.bst

depends:
- components/python3-setuptools.bst
- components/jpeg.bst

sources:
- kind: git_tag
  url: github:python-pillow/Pillow.git
  track: main
  track-extra:
  - 7.2.x
  ref: 7.2.0-0-g2bd74943fb9f320def6c066e732b701d1c15f677
