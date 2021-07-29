kind: pip

build-depends:
- components/python3-pip.bst
- components/python3-wheel.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: importlib-resources
  url: pypi:d5/7f/15c3daac87930bc474fd8658c1c7ea231a59f0a31d5a5c140bc17f79c8ad/importlib_resources-5.2.1.tar.gz
  sha256sum: c3789472eacdf3e20a4d746f7fe7cdf53c122e76f78813fbfb04d618e0152b6a
