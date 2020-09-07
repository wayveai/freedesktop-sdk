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
  url: pypi:5f/5c/c20ddfed9ffdbe4ea87820ddc4306447a5d0e980a8c4092ab4a1e703c553/poetry-1.1.0b2.tar.gz
  sha256sum: 9ce24374c637383fc9991e481cbb81b84254e98bc879678b920a5d5afe8a07cf
