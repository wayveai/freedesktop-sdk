kind: pip

build-depends:
- public-stacks/buildsystem-python.bst

depends:
- components/python3.bst

runtime-depends:
- components/python3-pyparsing.bst

sources:
- kind: pypi
  name: packaging
  url: pypi:df/86/aef78bab3afd461faecf9955a6501c4999933a48394e90f03cd512aad844/packaging-21.0.tar.gz
  sha256sum: 7dc96269f53a4ccec5c0670940a4281106dd0bb343f47b7471f779df49c2fbe7
