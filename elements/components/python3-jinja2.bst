kind: pip

build-depends:
- components/python3-pip.bst

depends:
- components/python3.bst

runtime-depends:
- components/python3-markupsafe.bst

sources:
- kind: pypi
  name: Jinja2
  url: pypi:1f/93/99a76d0fa1a8fc14442a6421abee323f8d15964979336eabd2a1834e9118/Jinja2-3.1.0.tar.gz
  sha256sum: a2f09a92f358b96b5f6ca6ecb4502669c4acb55d8733bbb2b2c9c4af5564c605
