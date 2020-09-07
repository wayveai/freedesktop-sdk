kind: pip

build-depends:
- components/python3-pip.bst
- components/python3-wheel.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: shellingham
  url: pypi:4b/f0/39516ebeaca978d6607609a283b15e7637622faffc5f01ecf78a49b24cd5/shellingham-1.3.2.tar.gz
  sha256sum: 576c1982bea0ba82fb46c36feb951319d7f42214a82634233f58b40d858a751e
