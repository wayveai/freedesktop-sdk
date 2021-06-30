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
  ref: 21.1.3-0-ge69a8f3987f44178dec8b9137158b4a6ed778ca3
  exclude:
  - '*b?'
  - '*rc?'
  - -*a?'
