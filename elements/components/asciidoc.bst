kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: components/docbook-xml.bst
  type: build
- filename: components/docbook-xsl.bst
  type: build
- filename: components/libxslt.bst
  type: build
- filename: components/python3.bst

variables:
  builddir: ''

sources:
# We track master until 9.0.0 is tagged. The older tags are for
# python2 version which we no longer ship in the project.
- kind: git_tag
  url: github:asciidoc/asciidoc-py3.git
  track: master
  exclude:
  - '*a*'
  - '*b*'
  - '*rc*'
  ref: 9.0.4-0-g8de61a75572b5b8f90c1f87634aa3767472be7a7
