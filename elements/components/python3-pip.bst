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
    sha256sum: 2debf847016cfe643fa1512e2d781d3ca9e5c878ba0652583842d50cc2bcc605
    suffix: 99/bb/696e256f4f445809f25efd4e4ce42ff99664dc089cafa1e097d5fec7fc33/pip-22.1.tar.gz
