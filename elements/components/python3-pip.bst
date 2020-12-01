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
  ref: 20.3-0-gc31c148a5b1d87591862c715adc7a7e5f3242fba
  exclude:
  - '*b?'
  - '*rc?'
  - -*a?'
