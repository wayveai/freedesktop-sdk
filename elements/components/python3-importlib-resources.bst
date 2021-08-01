kind: pip

build-depends:
- components/python3-pip.bst
- components/python3-wheel.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: importlib-resources
  url: pypi:b1/7a/b9e2309e5c619ba3da8806e43bb17873ec6eab22a3d79347778c80563028/importlib_resources-5.2.2.tar.gz
  sha256sum: a65882a4d0fe5fbf702273456ba2ce74fe44892c25e42e057aca526b702a6d4b
