kind: pip

build-depends:
- components/python3-pip.bst

depends:
- components/python3.bst

runtime-depends:
- components/python3-pytz.bst

sources:
- kind: pypi
  name: babel
  url: pypi:17/e6/ec9aa6ac3d00c383a5731cc97ed7c619d3996232c977bb8326bcbb6c687e/Babel-2.9.1.tar.gz
  sha256sum: bc0c176f9f6a994582230df350aa6e05ba2ebe4b3ac317eab29d9be5d2768da0
