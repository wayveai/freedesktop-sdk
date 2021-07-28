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
  ref: 21.2.1-0-gbd41229cdced10d2b7c304a1ef2d61baad3c7da0
  exclude:
  - '*b?'
  - '*rc?'
  - -*a?'
