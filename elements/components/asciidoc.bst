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
# We exclude legacy tags from python2 version
# and wait for 9.0.0
- kind: git_tag
  url: github:asciidoc/asciidoc-py3.git
  track: master
  exclude:
  - 8.*
  ref: 5b8771e2497ebfc70c93756d2afe9cd6f6c73641
