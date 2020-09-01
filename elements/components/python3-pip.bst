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
- kind: git_tag
  url: github:pypa/pip.git
  track: master
  ref: 20.2.2-0-ge16ebf1b7fd77ad96eeb5ec07ae5326bea02268a
  exclude:
  - '*b?'
  - '*rc?'
  - -*a?'
