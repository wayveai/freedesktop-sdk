kind: distutils

depends:
- bootstrap-import.bst
- components/python3.bst
- components/python3-setuptools.bst

config:
  install-commands:
    (>):
    - |
      rm "%{install-root}%{bindir}/pip"

sources:
- kind: pypi
  name: pip
  url: pypi:d9/c1/146b24a7648fdf3f8b4dc6521ab0b26ac151ef903bac0b63a4e1450cb4d1/pip-22.0.2.tar.gz
  sha256sum: 27b4b70c34ec35f77947f777070d8331adbb1e444842e98e7150c288dc0caea4

