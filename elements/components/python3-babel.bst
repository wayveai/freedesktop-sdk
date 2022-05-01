kind: pip

build-depends:
- components/python3-pip.bst

depends:
- components/python3.bst

runtime-depends:
- components/python3-pytz.bst

sources:
- kind: pypi
  name: babel
  ref:
    sha256sum: 98aeaca086133efb3e1e2aad0396987490c8425929ddbcfe0550184fdc54cd13
    suffix: 23/a6/a616817c8e4fb1a69f7e8aae9fc7fce1a147e1a492f45b6fa0b7d6823178/Babel-2.10.1.tar.gz
