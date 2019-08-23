kind: distutils

depends:
- filename: bootstrap-import.bst
- filename: base/python3.bst

variables:
  python: python3
  fix-pyc-timestamps: "true"

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
  ref: v40.8.0-0-gc1243e96f05d3b13392a792144c97d9471581550
