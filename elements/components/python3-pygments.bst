kind: pip

depends:
- filename: bootstrap-import.bst
- filename: components/python3.bst
- filename: components/python3-pip.bst
  type: build

sources:
- kind: pypi
  name: pygments
  url: pypi:5d/9d/208733ccc91b1d2c2af7270ffe3def197504bd8da875bc3fa1dc75039795/Pygments-2.7.0.tar.gz
  sha256sum: 2594e8fdb06fef91552f86f4fd3a244d148ab24b66042036e64f29a291515048
