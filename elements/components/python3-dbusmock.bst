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
  url: pypi:d6/b5/478581d5778ad8046bf943878d7c86e5e9fe6f130dedb7ca7517666bc536/python-dbusmock-0.26.1.tar.gz
  sha256sum: 0e95ef6ec1e6b58aeb0e08839a76972debea94184570f09e29e5f12551399e55
