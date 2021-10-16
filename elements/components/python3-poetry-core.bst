kind: pip

build-depends:
- components/python3-pip.bst

depends:
- components/python3.bst
- components/python3-intreehooks.bst
- components/python3-toml.bst

sources:
- kind: pypi
  name: poetry-core
  url: pypi:40/d0/adc9ab25f68d9382f32c355627423a32135efaa5aaeebd6dec6d19e6b0af/poetry-core-1.0.7.tar.gz
  sha256sum: 98c11c755a16ef6c5673c22ca94a3802a7df4746a0853a70b6fae8b9f5cac206
