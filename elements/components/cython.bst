kind: pip

build-depends:
- public-stacks/buildsystem-python.bst

runtime-depends:
- components/python3.bst

sources:
- kind: pypi
  name: cython
  ref:
    sha256sum: d6fac2342802c30e51426828fe084ff4deb1b3387367cf98976bb2e64b6f8e45
    suffix: cb/da/54a5d7a7d9afc90036d21f4b58229058270cc14b4c81a86d9b2c77fd072e/Cython-0.29.28.tar.gz
