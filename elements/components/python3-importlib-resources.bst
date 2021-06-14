kind: pip

build-depends:
- components/python3-pip.bst
- components/python3-wheel.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: importlib-resources
  url: pypi:7e/6c/2077c481c94e7a75e0678a41cb4e2a7916ac215e7a7677c5839513122d24/importlib_resources-5.1.4.tar.gz
  sha256sum: 54161657e8ffc76596c4ede7080ca68cb02962a2e074a2586b695a93a925d36e
