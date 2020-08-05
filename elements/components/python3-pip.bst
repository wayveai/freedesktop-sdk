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
  ref: 20.2.1-0-gfa2714fcd6cc641bfba45dcd93ea206aa4752b95
  exclude:
  - '*b?'
  - '*rc?'
  - -*a?'
