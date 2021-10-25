kind: pip

build-depends:
- components/python3-pip.bst
- components/python3-wheel.bst

depends:
- components/python3.bst
- components/python3-setuptools.bst
- components/git-minimal.bst

sources:
- kind: pypi
  name: setuptools_scm
  url: pypi:cd/66/fa77e809b7cb1c2e14b48c7fc8a8cd657a27f4f9abb848df0c967b6e4e11/setuptools_scm-4.1.2.tar.gz
  sha256sum: a8994582e716ec690f33fec70cca0f85bd23ec974e3f783233e4879090a7faa8
