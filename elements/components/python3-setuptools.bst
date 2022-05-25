kind: distutils

depends:
- bootstrap-import.bst
- components/python3.bst
- components/util-linux.bst

sources:
- kind: pypi
  name: setuptools
  ref:
    sha256sum: a43bdedf853c670e5fed28e5623403bad2f73cf02f9a2774e91def6bda8265a7
    suffix: 4a/25/ec29a23ef38b9456f9965c57a9e1221e6c246d87abbf2a31158799bca201/setuptools-62.3.2.tar.gz
