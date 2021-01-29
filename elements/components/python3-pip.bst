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
  url: pypi:cb/5f/ae1eb8bda1cde4952bd12e468ab8a254c345a0189402bf1421457577f4f3/pip-20.3.1.tar.gz
  sha256sum: 43f7d3811f05db95809d39515a5111dd05994965d870178a4fe10d5482f9d2e2
- kind: patch
  path: patches/pip/deterministic-temp.patch
