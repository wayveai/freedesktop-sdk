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
  url: pypi:38/cc/db23dbe4efc464c3c0111fedf7d46de8888f05b09488d610f6f8ab6e2544/setuptools-49.6.0.zip
  sha256sum: 46bd862894ed22c2edff033c758c2dc026324788d758e96788e8f7c11f4e9707
