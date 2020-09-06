kind: distutils

depends:
- filename: bootstrap-import.bst
- filename: components/python3.bst

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
  ref: v50.3.0-0-gf84c145482d273cd6b90e20012443edcfd59ff0d
