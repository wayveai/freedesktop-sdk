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
  ref: 22.0.4-0-g29ddc93ee8f33f4e1c7402a16b32bdf5b61c7369
  match:
  - 22.0.*
  exclude:
  - '*b?'
  - '*rc?'
  - -*a?'
