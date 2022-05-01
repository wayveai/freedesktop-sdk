kind: pip

build-depends:
- public-stacks/buildsystem-python.bst

depends:
- components/python3.bst

runtime-depends:
- components/python3-jinja2.bst
- components/python3-markdown.bst
- components/python3-markupsafe.bst
- components/python3-pygments.bst
- components/python3-toml.bst
- components/python3-typogrify.bst

sources:
- kind: pypi
  name: gi-docgen
  ref:
    sha256sum: f91d879ff28d7d5265cde84275ee510e32386bfeb7ec6203a647342aead55cec
    suffix: 25/11/64ea759ba610d7442e8827306d1adba233ca69547d2a0e974f5ea74fa320/gi-docgen-2022.1.tar.gz
