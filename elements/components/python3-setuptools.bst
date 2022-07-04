kind: distutils

depends:
- bootstrap-import.bst
- components/python3.bst
- components/util-linux.bst

sources:
- kind: pypi
  name: setuptools
  ref:
    sha256sum: 16923d366ced322712c71ccb97164d07472abeecd13f3a6c283f6d5d26722793
    suffix: 67/25/42e2d6664c3e106c33ecad8356a55e3ae5d81708c89098061a97fbff7cee/setuptools-63.1.0.tar.gz
