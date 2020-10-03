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
  url: gnome:gtk-doc.git
  track: master
  ref: 1.33.0-0-gcb88c112346c3224ce1e903d84c864e1af1d7e9c
