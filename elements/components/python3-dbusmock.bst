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
  ref:
    sha256sum: 0bff30d8d01e7eef491f75d359c87765abba7001307fa8fed19cb59f06ed3c2a
    suffix: d0/89/54ef3030f6a0ee5557d0c411085b8f76541c3595404c4879f8f109351eb9/python-dbusmock-0.27.5.tar.gz
