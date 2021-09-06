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
  url: pypi:00/59/5a302942bd2e36194cc37a408989a87d6423e000859713dc3dd440c9dbae/setuptools-58.0.0.tar.gz
  sha256sum: ee45f4d69c4bbd21a27b60a7f1f32cbdcd34755cb613e5c4edcb58145394a0a3
