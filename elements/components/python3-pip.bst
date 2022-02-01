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
  ref: 22.0.2-0-gc721f03190ef888711e8e9efe6ca8345ec6464f3
  exclude:
  - '*b?'
  - '*rc?'
  - -*a?'
