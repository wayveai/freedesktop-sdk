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

sources:
- kind: pypi
  name: setuptools
  url: pypi:9b/be/13f54335c7dba713b0e97e11e7a41db3df4a85073d6c5a6e7f6468b22ee2/setuptools-60.2.0.tar.gz
  sha256sum: 675fcebecb43c32eb930481abf907619137547f4336206e4d673180242e1a278
