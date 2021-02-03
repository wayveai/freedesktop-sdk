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
  url: pypi:12/68/95515eaff788370246dac534830ea9ccb0758e921ac9e9041996026ecaf2/setuptools-53.0.0.tar.gz
  sha256sum: 1b18ef17d74ba97ac9c0e4b4265f123f07a8ae85d9cd093949fa056d3eeeead5
