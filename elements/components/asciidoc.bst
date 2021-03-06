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
  track: main
  track-tags: false
  ref: 8.6.9-173-g5b8771e2497ebfc70c93756d2afe9cd6f6c73641
