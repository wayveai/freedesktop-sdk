kind: pip

build-depends:
- public-stacks/buildsystem-python.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: pyelftools
  url: pypi:6b/b5/f7022f2d950327ba970ec85fb8f85c79244031092c129b6f34ab17514ae0/pyelftools-0.27.tar.gz
  sha256sum: cde854e662774c5457d688ca41615f6594187ba7067af101232df889a6b7a66b
