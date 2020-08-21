kind: pip

build-depends:
- components/python3-pip.bst
- public-stacks/buildsystem-autotools.bst

depends:
- components/python3.bst
- components/libdbus.bst
- components/glib.bst

sources:
- kind: pypi
  name: dbus-python
  url: pypi:62/7e/d4fb56a1695fa65da0c8d3071855fa5408447b913c58c01933c2f81a269a/dbus-python-1.2.16.tar.gz
  sha256sum: 11238f1d86c995d8aed2e22f04a1e3779f0d70e587caffeab4857f3c662ed5a4
