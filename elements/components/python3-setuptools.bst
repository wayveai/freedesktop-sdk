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
  ref: v46.4.0-0-gb92164bd9ecc08374e1e5e810cf0bc37c8fb9aca
