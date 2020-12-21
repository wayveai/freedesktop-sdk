kind: pip

depends:
- components/python3.bst

build-depends:
- components/python3-pip.bst

runtime-depends:
- components/python3-urllib3.bst
- components/python3-certifi.bst
- components/python3-idna.bst
- components/python3-chardet.bst

sources:
- kind: pypi
  name: requests
  url: pypi:6b/47/c14abc08432ab22dc18b9892252efaf005ab44066de871e72a38d6af464b/requests-2.25.1.tar.gz
  sha256sum: 27973dd4a904a4f13b263a19c866c13b92a39ed1c964655f025f3f8d3d75b804
