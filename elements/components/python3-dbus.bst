kind: pip

depends:
- filename: components/python3.bst
- filename: components/python3-pip.bst
  type: build
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: components/dbus.bst
- filename: components/glib.bst

sources:
- kind: tar
  url: https://files.pythonhosted.org/packages/b6/85/7b46d31f15a970665533ad5956adee013f03f0ad4421c3c83304ae9c9906/dbus-python-1.2.12.tar.gz
  ref: cdd4de2c4f5e58f287b12013ed7b41dee81d503c8d0d2397c5bd2fb01badf260
