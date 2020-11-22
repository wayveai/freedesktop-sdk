kind: pip

build-depends:
- public-stacks/buildsystem-python.bst

runtime-depends:
- components/python3.bst

sources:
- kind: pypi
  name: cython
  url: pypi:6c/9f/f501ba9d178aeb1f5bf7da1ad5619b207c90ac235d9859961c11829d0160/Cython-0.29.21.tar.gz
  sha256sum: e57acb89bd55943c8d8bf813763d20b9099cc7165c0f16b707631a7654be9cad
