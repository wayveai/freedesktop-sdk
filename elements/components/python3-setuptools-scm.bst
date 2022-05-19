kind: pip

build-depends:
- public-stacks/buildsystem-python.bst

depends:
- components/git.bst
- components/python3.bst
- components/python3-packaging.bst
- components/python3-setuptools.bst
- components/python3-tomli.bst

sources:
- kind: pypi
  name: setuptools_scm
  url: pypi:4a/18/477d3d9eb2f88230ff2a41de9d8ffa3554b706352787d289f57f76bfba0b/setuptools_scm-6.4.2.tar.gz
  sha256sum: 6833ac65c6ed9711a4d5d2266f8024cfa07c533a0e55f4c12f6eff280a5a9e30
