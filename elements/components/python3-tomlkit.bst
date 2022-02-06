kind: pip

build-depends:
- components/python3-pip.bst
- components/python3-poetry-core.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: tomlkit
  url: pypi:ba/ce/b140a544f834a1789c0c05be42327e71980b1a36318fc8bed932daee219e/tomlkit-0.9.0.tar.gz
  sha256sum: 5a83672c565f78f5fc8f1e44e5f2726446cc6b765113efd21d03e9331747d9ab
