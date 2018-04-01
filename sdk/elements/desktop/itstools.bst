kind: autotools

depends:
  - filename: base.bst

variables:
  conf-local:
    PYTHON="/usr/bin/python3"

sources:
  - kind: tar
    url: http://files.itstool.org/itstool/itstool-2.0.4.tar.bz2
    ref: 97c208b51da33e0b553e830b92655f8deb9132f8fbe9a646771f95c33226eb60
