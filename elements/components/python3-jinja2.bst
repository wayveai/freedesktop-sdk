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
  url: pypi:91/a5/429efc6246119e1e3fbf562c00187d04e83e54619249eb732bb423efa6c6/Jinja2-3.0.3.tar.gz
  sha256sum: 611bb273cd68f3b993fabdc4064fc858c5b47a973cb5aa7999ec1ba405c87cd7
