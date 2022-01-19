kind: pip

build-depends:
- public-stacks/buildsystem-python.bst

runtime-depends:
- components/python3.bst

sources:
- kind: pypi
  name: cython
  url: pypi:bc/fa/8604d92ef753e0036d807f1b3179813ab2fa283e3b19c926e11673c8205b/Cython-0.29.26.tar.gz
  sha256sum: af377d543a762867da11fcf6e558f7a4a535ff8693f30cce123fab10c00fa312
