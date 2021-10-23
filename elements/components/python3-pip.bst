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
  url: pypi:da/f6/c83229dcc3635cdeb51874184241a9508ada15d8baa337a41093fab58011/pip-21.3.1.tar.gz
  sha256sum: fd11ba3d0fdb4c07fbc5ecbba0b1b719809420f25038f8ee3cd913d3faa3033a

