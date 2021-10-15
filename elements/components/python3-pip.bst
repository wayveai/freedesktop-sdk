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
  ref: 21.2.4-0-g73fc5ff71a7926e578d1771e2e10c780265a86f3
  exclude:
  - '*b?'
  - '*rc?'
  - -*a?'
