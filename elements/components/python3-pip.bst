kind: distutils

depends:
- filename: bootstrap-import.bst
- filename: components/python3.bst
- filename: components/python3-setuptools.bst

config:
  install-commands:
    (>):
    - |
      rm "%{install-root}%{bindir}/pip"

sources:
- kind: pypi
  name: pip
  url: pypi:9e/24/bc928987f35dd0167f21b13a1777c21b9c5917c9894cff93f1c1a6cb8f3b/pip-21.0.tar.gz
  sha256sum: b330cf6467afd5d15f4c1c56f5c95e56a2bfb941c869bed4c1aa517bcb16de25
