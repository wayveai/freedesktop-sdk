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
  ref: 20.2.4-0-g57dd580f582f33310f1c53cca2af2255985425d2
  exclude:
  - '*b?'
  - '*rc?'
  - -*a?'
