kind: pip

depends:
- filename: bootstrap-import.bst
- filename: components/python3.bst
- filename: components/python3-pip.bst
  type: build

sources:
- kind: pypi
  name: pygments
  url: pypi:15/53/5345177cafa79a49e02c27102019a01ef1682ab170d2138deca47a4c8924/Pygments-2.11.1.tar.gz
  sha256sum: 59b895e326f0fb0d733fd28c6839bd18ad0687ba20efc26d4277fd1d30b971f4
