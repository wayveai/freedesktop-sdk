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
  ref: 20.3.1-0-gf94a429e17b450ac2d3432f46492416ac2cf58ad
  exclude:
  - '*b?'
  - '*rc?'
  - -*a?'
