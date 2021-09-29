kind: pip

build-depends:
- public-stacks/buildsystem-python.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: filelock
  url: pypi:40/6e/75062649204602805de42a1faa614e16a57ee3d3331302a1de2d7c4db4e3/filelock-3.1.0.tar.gz
  sha256sum: 78925788ce8c8945fac28a68c1d05cf33a6a6c4fba14fe02835122c53268ceef
