kind: distutils

depends:
- filename: bootstrap-import.bst
- filename: base/python3.bst
- filename: base/python3-setuptools.bst

variables:
  python: python3
  fix-pyc-timestamps: "true"

config:
  install-commands:
    (>):
    - |
      rm "%{install-root}%{bindir}/pip"

sources:
- kind: git_tag
  url: github:pypa/pip.git
  track: master
  ref: 19.0.3-0-ga8de4eb49a45035aefd9a122b6d1d67915663d5f
