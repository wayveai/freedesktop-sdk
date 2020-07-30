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
  ref: 20.2-0-g127acd8c9eed66f1c0e2d251639b6d378f66b488
  exclude:
  - '*b?'
  - '*rc?'
  - -*a?'
