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
  ref: 20.2.3-0-g8c2102a310372dea70f12e9581b334783441bcea
  exclude:
  - '*b?'
  - '*rc?'
  - -*a?'
