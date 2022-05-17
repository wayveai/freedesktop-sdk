kind: pip

build-depends:
- public-stacks/buildsystem-python.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: filelock
  url: pypi:32/0e/e4a925976b09898ca585cdd5497f158daab6ffb59b61dab5108df00416ac/filelock-3.7.0.tar.gz
  sha256sum: b795f1b42a61bbf8ec7113c341dad679d772567b936fbd1bf43c9a238e673e20
