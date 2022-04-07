kind: pip

build-depends:
- components/python3-pip.bst

depends:
- components/python3-setuptools.bst
- components/jpeg.bst

sources:
- kind: pypi
  name: Pillow
  url: pypi:4b/83/090146d7871d90a2643d469c319c1d014e41b315ab5cf0f8b4b6a764ef31/Pillow-9.1.0.tar.gz
  sha256sum: f401ed2bbb155e1ade150ccc63db1a4f6c1909d3d378f7d1235a44e90d75fb97
