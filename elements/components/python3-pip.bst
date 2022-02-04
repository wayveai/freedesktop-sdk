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
  ref: 22.0.3-0-g44018de50cafba25445a225c1a1986d6312e1ef3
  exclude:
  - '*b?'
  - '*rc?'
  - -*a?'
