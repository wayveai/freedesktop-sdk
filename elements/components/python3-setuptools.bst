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
  url: pypi:ea/81/a7428efddb7bac2db7969cc02c94d89f57a98acdc0b6f760c7e123234ab5/setuptools-51.1.0.tar.gz
  sha256sum: b4f6f2e65bbdb66452f6f94da46a436da962da3ec1f8a412fdba3bcd4fdc4eb7
