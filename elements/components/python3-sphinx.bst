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
  url: pypi:45/14/8a3bf633c8141bd58e027f36fc5e775da308c635437eb45f13d1633915ea/Sphinx-4.3.0.tar.gz
  sha256sum: 6d051ab6e0d06cba786c4656b0fe67ba259fe058410f49e95bee6e49c4052cbf
