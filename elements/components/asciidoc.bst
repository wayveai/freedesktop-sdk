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
  ref: 9.0.2-0-g9a407dc9a497364c91421fd961954eddb565baf1
