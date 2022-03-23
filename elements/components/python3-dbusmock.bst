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
  url: pypi:f5/cb/1eaff91dc0797de8a71a5e0f21dba3293618c309fe2e2218be86b674ef4c/python-dbusmock-0.27.3.tar.gz
  sha256sum: 24feaa524e0631854a7f0529ef757c1e4c542adef89cf04e1d4248bc512a006f
