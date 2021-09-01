kind: distutils

depends:
- bootstrap-import.bst
- components/python3.bst
- components/util-linux.bst

sources:
- kind: pypi
  name: setuptools
  url: pypi:db/e2/c0ced9ccffb61432305665c22842ea120c0f649eec47ecf2a45c596707c4/setuptools-57.4.0.tar.gz
  sha256sum: 6bac238ffdf24e8806c61440e755192470352850f3419a52f26ffe0a1a64f465
