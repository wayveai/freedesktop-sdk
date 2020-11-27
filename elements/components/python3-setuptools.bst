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
  url: pypi:a7/e0/30642b9c2df516506d40b563b0cbd080c49c6b3f11a70b4c7a670f13a78b/setuptools-50.3.2.zip
  sha256sum: ed0519d27a243843b05d82a5e9d01b0b083d9934eaa3d02779a23da18077bd3c
