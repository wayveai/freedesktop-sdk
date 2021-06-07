kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst

depends:
- components/cairo.bst
- components/python3.bst

sources:
- kind: pypi
  name: pycairo
  url: pypi:bc/3f/64e6e066d163fbcf13213f9eeda0fc83376243335ea46a66cefd70d62e8f/pycairo-1.20.1.tar.gz
  sha256sum: 1ee72b035b21a475e1ed648e26541b04e5d7e753d75ca79de8c583b25785531b
