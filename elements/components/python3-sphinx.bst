kind: pip

build-depends:
- components/python3-pip.bst

depends:
- components/python3.bst

runtime-depends:
- components/python3-alabaster.bst
- components/python3-babel.bst
- components/python3-docutils.bst
- components/python3-imagesize.bst
- components/python3-jinja2.bst
- components/python3-packaging.bst
- components/python3-pygments.bst
- components/python3-requests.bst
- components/python3-setuptools.bst
- components/python3-snowballstemmer.bst
- components/python3-sphinxcontrib-applehelp.bst
- components/python3-sphinxcontrib-devhelp.bst
- components/python3-sphinxcontrib-htmlhelp.bst
- components/python3-sphinxcontrib-jsmath.bst
- components/python3-sphinxcontrib-qthelp.bst
- components/python3-sphinxcontrib-serializinghtml.bst

public:
  bst:
    integration-commands:
    - python3 -c "import pkg_resources; pkg_resources.require('sphinx')"

sources:
- kind: pypi
  name: sphinx
  url: pypi:14/e4/979056baa6369fd1365bfe90d1db1d982c373bc3e3a557624b85b3597cb0/Sphinx-3.5.2.tar.gz
  sha256sum: 672cfcc24b6b69235c97c750cb190a44ecd72696b4452acaf75c2d9cc78ca5ff
