kind: distutils

depends:
- bootstrap-import.bst
- components/python3.bst
- components/util-linux.bst

sources:
- kind: pypi
  name: setuptools
  ref:
    sha256sum: 7f4bc85450898a09f76ebf28b72fa25bc7111f6c7d665d514a60bba9c75ef2a9
    suffix: 15/a7/b4cab9eca586ed17c66b3aced23ccf945312c50742614039d0cd71c870bd/setuptools-65.2.0.tar.gz
