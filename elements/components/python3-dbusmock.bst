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
    sha256sum: 6434e544c055e3570b20e341e50a3d2dd50b19d9e55d579b919e14879f9f1e57
    suffix: 78/11/e43401e0729514689d8a724a0a1d81ed2d6e3ae497ad10a06b60113b167e/python-dbusmock-0.28.1.tar.gz
