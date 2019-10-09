kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: components/itstool.bst
- filename: components/docbook-xml.bst
- filename: components/docbook-xsl.bst
- filename: components/pkg-config.bst   # gtk-doc uses pkg-config during runtime.
- filename: components/python3.bst
- filename: components/python3-pygments.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build

public:
  cpe:
    version: '1.32'

sources:
- kind: git_tag
  url: gnome:gtk-doc
  track: master
  ref: GTK_DOC_1_32-0-g7fce5688c973fca10951bfdbeab9acca034aa095
