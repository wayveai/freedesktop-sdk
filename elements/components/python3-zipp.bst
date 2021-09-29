kind: pip

build-depends:
- components/python3-pip.bst
- components/python3-wheel.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: zipp
  url: pypi:76/e4/b0f1010d29a61e3527667b214498da73299f747dd25ad0fd135705170716/zipp-3.5.1.tar.gz
  sha256sum: 1fc9641b26f3bd81069b7738b039f2819cab6e3fc3399a953e19d92cc81eff4d
