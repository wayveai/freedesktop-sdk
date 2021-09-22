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
  url: pypi:c8/8a/33c9d7cde6fab76b6978d01be4f8e1cfe2c9ad28fa07d1557e32bf6b0755/poetry-core-1.0.6.tar.gz
  sha256sum: dd3c97003579242236890306836f2acc86d9741e6bea320dda6f844f16b0d845
