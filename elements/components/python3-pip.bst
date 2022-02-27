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
  url: pypi:88/d9/761f0b1e0551a3559afe4d34bd9bf68fc8de3292363b3775dda39b62ce84/pip-22.0.3.tar.gz
  sha256sum: f29d589df8c8ab99c060e68ad294c4a9ed896624f6368c5349d70aa581b333d0

