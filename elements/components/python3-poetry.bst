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
  url: pypi:94/89/92040eafbb76dcbb2b3ee185499b89281f712b34faa7673850778b0ddda4/poetry-1.1.4.tar.gz
  sha256sum: 946a5a1173be607c7c5c593358a0fb0c0d6af4400c978929ecdb19c3a37b53a8
