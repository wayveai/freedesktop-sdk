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
  exclude:
  - '^.*(?:[ab]|rc)[0-9]*$'
  url: pypi:73/8e/7774190ac616c69194688ffce7c1b2a097749792fea42e390e7ddfdef8bc/pip-20.2.2.tar.gz
  sha256sum: 58a3b0b55ee2278104165c7ee7bc8e2db6f635067f3c66cf637113ec5aa71584
