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
  ref: v41.4.0-0-g5eee6b4b523a6d2ae16ef913c01302f951b4f614
