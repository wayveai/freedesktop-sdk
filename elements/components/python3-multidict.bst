kind: pip

depends:
- components/python3.bst

build-depends:
- components/python3-pip.bst
- components/python3-wheel.bst
- components/cython.bst

config:
  build-commands:
    (<):
    - cython -3 -o multidict/_multidict.c multidict/_multidict.pyx -I multidict

sources:
- kind: git_tag
  url: github:aio-libs/multidict.git
  track: master
  ref: v4.6.1-0-g4309deb1a9679567b88ec0d108e998d903328ef1
