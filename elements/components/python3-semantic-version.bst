kind: pip

build-depends:
- public-stacks/buildsystem-python.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: semantic_version
  ref:
    sha256sum: abf54873553e5e07a6fd4d5f653b781f5ae41297a493666b59dcf214006a12b2
    suffix: cb/56/4aa487b46d09646eb1863faa7026551d8309ece2281794bf13b20f28ab94/semantic_version-2.9.0.tar.gz
