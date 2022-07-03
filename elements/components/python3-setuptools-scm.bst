kind: pip

build-depends:
- components/python3-pip.bst
- components/python3-wheel.bst

depends:
- components/python3.bst
- components/python3-setuptools.bst
- components/git-minimal.bst
- components/python3-tomli.bst
- components/python3-typing-extensions.bst
- components/python3-packaging.bst

sources:
- kind: pypi
  name: setuptools_scm
  ref:
    sha256sum: c27bc1f48593cfc9527251f1f0fc41ce282ea57bbc7fd5a1ea3acb99325fab4c
    suffix: 03/b6/052aacb07081ef5d4cae2daaae19c5d11e25b1122087af4710963cb25867/setuptools_scm-7.0.4.tar.gz
