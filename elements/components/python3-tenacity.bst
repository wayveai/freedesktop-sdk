kind: pip

depends:
- components/python3.bst

build-depends:
- components/python3-pip.bst
- components/python3-wheel.bst
- components/python3-setuptools-scm.bst

sources:
- kind: pypi
  name: tenacity
  url: pypi:a9/26/dfe61bbfbe7d723fe76ff41960c96161fd32ff303be88bbbdfb428250cd4/tenacity-6.2.0.tar.gz
  sha256sum: 29ae90e7faf488a8628432154bb34ace1cca58244c6ea399fd33f066ac71339a
