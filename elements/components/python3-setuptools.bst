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
  url: pypi:12/e1/b9a2926a3c5a3fb055b8f85052f5baa890106a0e21b64a977c10affea751/setuptools-51.0.0.zip
  sha256sum: 029c49fd713e9230f6a41c0298e6e1f5839f2cde7104c0ad5e053a37777e7688
