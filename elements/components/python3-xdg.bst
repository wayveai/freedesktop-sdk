kind: pip

build-depends:
- components/python3-pip.bst
- components/python3-poetry.bst

depends:
- components/python3.bst

sources:
- kind: tar
  url: pypi:a4/54/923c5a30db7ce3df6aa4cc9ad785847d2356443781da85b8d769d4737622/xdg-4.0.1.tar.gz
  ref: c939c99def394cbaf765a3ee55efd6ea7e4c5eaed8d9ebc2d03af84ba35dec57
