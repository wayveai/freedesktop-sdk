kind: pip

build-depends:
- public-stacks/buildsystem-python.bst

runtime-depends:
- components/python3.bst

sources:
- kind: pypi
  name: cython
  url: pypi:eb/46/80dd9e5ad67ebc766ff3229901bde4a7bc82907efe93cd7007c4df458dd5/Cython-0.29.27.tar.gz
  sha256sum: c6a442504db906dfc13a480e96850cced994ecdc076bcf492c43515b78f70da2
