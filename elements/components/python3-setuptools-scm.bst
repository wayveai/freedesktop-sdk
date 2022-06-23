kind: pip

build-depends:
- components/python3-pip.bst
- components/python3-wheel.bst

depends:
- components/python3.bst
- components/python3-setuptools.bst
- components/git-minimal.bst
- components/python3-tomli.bst
- components/python3-packaging.bst

sources:
- kind: pypi
  name: setuptools_scm
  ref:
    sha256sum: 53afbaa882f43e5ec8e14f2d93b9c268dc62eb3f6cc8b2790f8cb97903e53c02
    suffix: 43/70/aff5e3c2463b08997e21f5f961d6ebfd32ce56d6026394664d6a10090cbb/setuptools_scm-7.0.2.tar.gz
