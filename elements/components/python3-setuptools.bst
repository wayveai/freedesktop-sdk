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
  url: pypi:80/98/8de0fd3e86d8286a2594e3fa6afc46d751130d26ebb7b1f34e9067992c6f/setuptools-58.3.0.tar.gz
  sha256sum: b0c2461641b58fe30e11d4c3dfba316c513bdf9ec85f9fed0c871c678447205e
