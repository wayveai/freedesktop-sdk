kind: pip

build-depends:
- components/python3-pip.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: networkx
  include:
  - '2\.8(\.|$)'
  exclude:
  - '.*rc.*'
  ref:
    sha256sum: ae99c9b0d35e5b4a62cf1cfea01e5b3633d8d02f4a0ead69685b6e7de5b85eab
    suffix: 4a/e2/1f9d6cf8562cf2bde58c102db70fe48d2d9652ec256f86bab6b279601b0d/networkx-2.8.2.tar.gz
