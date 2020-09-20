kind: distutils

depends:
- bootstrap-import.bst
- components/python3.bst
- components/util-linux.bst

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
- kind: pypi
  name: setuptools
  url: pypi:7c/1b/9b68465658cda69f33c31c4dbd511ac5648835680ea8de87ce05c81f95bf/setuptools-50.3.0.zip
  sha256sum: 39060a59d91cf5cf403fa3bacbb52df4205a8c3585e0b9ba4b30e0e19d4c4b18
