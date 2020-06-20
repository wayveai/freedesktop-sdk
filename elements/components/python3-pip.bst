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
  ref: 20.1-0-g5ce941ca5b6ac19f4003e8e7b5b07133c2df5f46
  exclude:
  - '*b?'
  - '*rc?'
  - -*a?'
