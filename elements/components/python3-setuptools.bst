kind: distutils

depends:
- bootstrap-import.bst
- components/python3.bst
- components/util-linux.bst

sources:
- kind: pypi
  name: setuptools
  ref:
    sha256sum: 1f5d3a1502812025cdb2e5609b6af2d207332e3f50febe6db10ed3a59b2f155f
    suffix: 7f/49/7c3f041fa83a28137f8945c025795d749292a1ab643d4d52cf63a3413849/setuptools-62.3.4.tar.gz
