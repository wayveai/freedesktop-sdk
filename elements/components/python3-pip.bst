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
  ref: 20.1.1-0-g8356bc5161e0a9b3054f0e04e12d18feae4c2b46
  exclude:
  - '*b?'
  - '*rc?'
  - -*a?'
