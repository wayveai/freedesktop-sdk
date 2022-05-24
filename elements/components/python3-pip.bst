kind: distutils

depends:
- bootstrap-import.bst
- components/python3.bst
- components/python3-setuptools.bst

config:
  install-commands:
    (>):
    - |
      rm "%{install-root}%{bindir}/pip"

sources:
- kind: pypi
  name: pip
  ref:
    sha256sum: 8dfb15d8a1c3d3085a4cbe11f29e19527dfaf2ba99354326fd62cec013eaee81
    suffix: 3e/0a/6125e67aa4d3245faeed476e4e26f190b5209f84f01efd733ac6372eb247/pip-22.1.1.tar.gz
