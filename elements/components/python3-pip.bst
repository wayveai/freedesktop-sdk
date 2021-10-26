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
  ref: 21.3.1-0-gf9914f3ebe223004b1d439a2b1980bd132d14f27
  exclude:
  - '*b?'
  - '*rc?'
  - -*a?'
