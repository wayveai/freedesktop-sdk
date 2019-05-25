kind: distutils

depends:
- filename: bootstrap-import.bst
- filename: components/python3.bst

variables:
  python: python3

config:
  configure-commands:
    (<):
    - |
      python3 bootstrap.py

  install-commands:
    (>):
    - |
      rm "%{install-root}%{bindir}/easy_install"

sources:
- kind: git_tag
  url: github:pypa/setuptools.git
  track: master
  ref: v41.0.1-0-g97d7563915b6e2ad8a638e988361357709a83bda
