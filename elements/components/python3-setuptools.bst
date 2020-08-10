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
  ref: v49.3.0-0-g9d7b246c0f40fabb25741a023849bf14919e408d
