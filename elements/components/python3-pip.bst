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
  ref: 21.0-0-g6c09bdd7c0aff4bb48d9524b9e46d94d1830e9da
  exclude:
  - '*b?'
  - '*rc?'
  - -*a?'
