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
  ref: v41.2.0-0-ga3e6e68365079642d8949b26ecb810751cc15ef1
