kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: components/intltool.bst
  type: build
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: components/libxml2.bst
- filename: components/glib.bst

variables:
  notparallel: true

sources:
- kind: git_tag
  url: freedesktop:xdg/shared-mime-info.git
  track: master
  ref: Release-1-12-0-g41a9a684249cd47aef4d65f81180ee69aa358d71
