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
  track: main
  ref: 21.2.3-0-gc2c92c7e8c05bca02cac793100a4bf43d0a1ddda
  exclude:
  - '*b?'
  - '*rc?'
  - -*a?'
