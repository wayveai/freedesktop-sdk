kind: pip

build-depends:
- components/python3-pip.bst
- components/python3-poetry.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: xdg
  url: pypi:7c/89/9bb25d3f0703c6db9760fb4cfec3f14d596a1ba763df848f53764b452371/xdg-5.0.1.tar.gz
  sha256sum: 97a27058caa61b4ce04e05471643caa6bc8c563d2638f92c0516ac50208146d8
