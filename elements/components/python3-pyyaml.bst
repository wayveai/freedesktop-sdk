kind: pip

build-depends:
- components/cython.bst
- components/python3-pip.bst

depends:
- components/python3.bst
- components/libyaml.bst

sources:
- kind: tar
  url: pypi:64/c2/b80047c7ac2478f9501676c988a5411ed5572f35d1beff9cae07d321512c/PyYAML-5.3.1.tar.gz
  ref: b8eac752c5e14d3eca0e6dd9199cd627518cb5ec06add0de9d32baeee6fe645d
