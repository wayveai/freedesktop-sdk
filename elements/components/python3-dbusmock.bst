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
  url: pypi:4e/43/fece2d40cc9a89ffc0d414603084500389fbfe43192ec64947517b1e89d3/python-dbusmock-0.25.0.tar.gz
  sha256sum: 6f4ce7650ecbb022684dc158df720e199635f3a3df75f7020f4fe8f6ff0394db
