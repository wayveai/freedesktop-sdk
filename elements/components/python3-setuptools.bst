kind: distutils

depends:
- bootstrap-import.bst
- components/python3.bst
- components/util-linux.bst

sources:
- kind: pypi
  name: setuptools
  ref:
    sha256sum: c04b44a57a6265fe34a4a444e965884716d34bae963119a76353434d6f18e450
    suffix: 0a/ba/52611dc8278828eb9ec339e6914a0f865f9e2af967214905927835dfac0a/setuptools-63.2.0.tar.gz
