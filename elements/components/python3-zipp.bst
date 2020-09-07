kind: pip

build-depends:
- components/python3-pip.bst
- components/python3-wheel.bst

depends:
- components/python3.bst

sources:
- kind: tar
  url: pypi:ce/8c/2c5f7dc1b418f659d36c04dec9446612fc7b45c8095cc7369dd772513055/zipp-3.1.0.tar.gz
  ref: c599e4d75c98f6798c509911d08a22e6c021d074469042177c8c86fb92eefd96
