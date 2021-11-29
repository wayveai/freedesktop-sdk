kind: distutils

depends:
- bootstrap-import.bst
- components/python3.bst
- components/util-linux.bst

config:
  configure-commands:
    (<):
    - |
      python3 bootstrap.py

sources:
- kind: pypi
  name: setuptools
  url: pypi:6e/41/853fda5af9b4c336965ebcaf10009d3ede674a010961ec80afaf17519247/setuptools-59.4.0.tar.gz
  sha256sum: b4c634615a0cf5b02cf83c7bedffc8da0ca439f00e79452699454da6fbd4153d
