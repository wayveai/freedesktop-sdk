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
  url: pypi:33/c9/e2164122d365d8f823213a53970fa3005eb16218edcfc56ca24cb6deba2b/pip-22.0.4.tar.gz
  sha256sum: b3a9de2c6ef801e9247d1527a4b16f92f2cc141cd1489f3fffaf6a9e96729764

