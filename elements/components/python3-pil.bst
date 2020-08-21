kind: pip

build-depends:
- components/python3-pip.bst

depends:
- components/python3-setuptools.bst
- components/jpeg.bst

sources:
- kind: pypi
  name: Pillow
  url: pypi:3e/02/b09732ca4b14405ff159c470a612979acfc6e8645dc32f83ea0129709f7a/Pillow-7.2.0.tar.gz
  sha256sum: 97f9e7953a77d5a70f49b9a48da7776dc51e9b738151b22dacf101641594a626
