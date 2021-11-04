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
  url: pypi:1d/d3/4e7e22c2e6f1cd7c31d78f573e44a83b45c013001c17ca53859d01155513/setuptools-58.5.2.tar.gz
  sha256sum: 132856b317080c4688b664e40164ad27fa210636258ee7c25cf2eb49b982ee51
