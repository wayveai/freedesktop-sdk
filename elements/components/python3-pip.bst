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
  ref: 20.3.3-0-ga387de10d81ca0688c7cd267be6054efeca89e94
  exclude:
  - '*b?'
  - '*rc?'
  - -*a?'
