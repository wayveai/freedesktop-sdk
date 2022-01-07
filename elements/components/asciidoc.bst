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
  track: 9.x
  exclude:
  - '*a*'
  - '*b*'
  - '*rc*'
  ref: 9.1.1-0-g08b430eb317c584aa6f02a3c4372035a4d8b92c4
