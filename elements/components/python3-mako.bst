kind: pip

depends:
- filename: bootstrap-import.bst
- filename: components/python3.bst
- filename: components/python3-setuptools.bst
- filename: components/python3-pip.bst
  type: build

sources:
- kind: pypi
  name: mako
  url: pypi:af/b6/42cd322ae555aa770d49e31b8c5c28a243ba1bbb57ad927e1a5f5b064811/Mako-1.1.6.tar.gz
  sha256sum: 4e9e345a41924a954251b95b4b28e14a301145b544901332e658907a7464b6b2
