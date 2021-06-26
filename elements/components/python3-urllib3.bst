kind: pip

depends:
- components/python3.bst

build-depends:
- components/python3-pip.bst

sources:
- kind: pypi
  name: urllib3
  url: pypi:4f/5a/597ef5911cb8919efe4d86206aa8b2658616d676a7088f0825ca08bd7cb8/urllib3-1.26.6.tar.gz
  sha256sum: f57b4c16c62fa2760b7e3d97c35b255512fb6b59a259730f36ba32ce9f8e342f
