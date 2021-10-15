kind: pip

build-depends:
- components/python3-pip.bst

depends:
- components/python3.bst
- components/python3-poetry-core.bst

runtime-depends:
- components/python3-cachecontrol.bst
- components/python3-cachy.bst
- components/python3-cleo.bst
- components/python3-clikit.bst
- components/python3-html5lib.bst
- components/python3-packaging.bst
- components/python3-pyexpect.bst
- components/python3-requests-toolbelt.bst
- components/python3-requests.bst
- components/python3-shellingham.bst
- components/python3-tomlkit.bst
- components/python3-virtualenv.bst

public:
  bst:
    overlap-whitelist:
    - '%{indep-libdir}/python*/site-packages/poetry/__init__.py'
    - '%{indep-libdir}/python*/site-packages/poetry/__pycache__/__init__.cpython-*.pyc'

sources:
- kind: pypi
  name: poetry
  url: pypi:57/93/30798f4df5633eaae1de4d851428fa72d281f949366c116eb21ed41530c5/poetry-1.1.11.tar.gz
  sha256sum: 7d7d22f55fbebb830cc85b1c69cd7a91fd85f49e5396e7a14b953645a470f69e
