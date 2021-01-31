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
  ref: 21.0.1-0-g22c6efd9cf514cd0c51e1e1d7de50aa2411689c2
  exclude:
  - '*b?'
  - '*rc?'
  - -*a?'
