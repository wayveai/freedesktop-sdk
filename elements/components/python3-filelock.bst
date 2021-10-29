kind: pip

build-depends:
- public-stacks/buildsystem-python.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: filelock
  url: pypi:8f/eb/6faad9294c8a8d59b7599a8a7c669c0e4c317fa5012bc36f1c8b379972a5/filelock-3.3.1.tar.gz
  sha256sum: 34a9f35f95c441e7b38209775d6e0337f9a3759f3565f6c5798f19618527c76f
