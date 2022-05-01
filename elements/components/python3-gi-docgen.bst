kind: pip

build-depends:
- public-stacks/buildsystem-python.bst

depends:
- components/python3.bst

runtime-depends:
- components/python3-jinja2.bst
- components/python3-markdown.bst
- components/python3-markupsafe.bst
- components/python3-pygments.bst
- components/python3-toml.bst
- components/python3-typogrify.bst

sources:
- kind: pypi
  name: gi-docgen

