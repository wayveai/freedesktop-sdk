kind: distutils

depends:
- bootstrap-import.bst
- components/python3.bst
- components/util-linux.bst

sources:
- kind: pypi
  name: setuptools
  url: pypi:a2/fc/f988372c4cdaaf6151ec4270be4e8ca45f0603256d979f81774fca73ad10/setuptools-61.2.0.tar.gz
  sha256sum: c3d4e2ab578fbf83775755cd76dae73627915a22832cf4ea5de895978767833b
