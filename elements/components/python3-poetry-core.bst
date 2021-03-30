kind: pip

build-depends:
- components/python3-pip.bst

depends:
- components/python3.bst
- components/python3-intreehooks.bst
- components/python3-pytoml.bst

sources:
- kind: pypi
  name: poetry-core
  url: pypi:d7/5a/58944c8905bb2519ae58cfab0a663fdfd88c692a6bdc51cc99416cd2f9e8/poetry-core-1.0.2.tar.gz
  sha256sum: ff505d656a6cf40ffbf84393d8b5bf37b78523a15def3ac473b6fad74261ee71
