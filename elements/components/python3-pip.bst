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
  ref: 21.2.2-0-gf7d912a21902d11448d8fb19cbb84ba1854bcdc4
  exclude:
  - '*b?'
  - '*rc?'
  - -*a?'
