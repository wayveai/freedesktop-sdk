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
  url: pypi:16/06/9a7ce305cf7c31d5f167f83e37c159e8b79ebe595b627cbc7d73d8468e81/Sphinx-3.3.1.tar.gz
  sha256sum: 1e8d592225447104d1172be415bc2972bd1357e3e12fdc76edf2261105db4300
