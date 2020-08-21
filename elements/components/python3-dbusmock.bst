kind: pip

depends:
- filename: components/python3.bst
- filename: components/python3-pip.bst
  type: build

- filename: components/python3-dbus.bst
  type: runtime

sources:
- kind: pypi
  name: python-dbusmock
  url: pypi:e7/98/091ea52b18dd55b9e4d882360125031d1286fdbf0d9922fd624fa8f78d4c/python-dbusmock-0.19.tar.gz
  sha256sum: 497f30eed2fcd5deaa2633b9622e4e99af4bdfba4e972b350ba630bac6fc86c2
