kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- bootstrap-import.bst
- components/python3.bst
- components/docbook-xsl.bst
- components/libxslt.bst

variables:
  builddir: ''

sources:
- kind: git_tag
  url: github:asciidoc/asciidoc-py3.git
  track: main
  exclude:
  - '*a*'
  - '*b*'
  - '*rc*'
  ref: 9.0.5-0-g1bc57fce4c6f048a343e5c64bf75a47f8fae1c0a
