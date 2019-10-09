kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: components/libxml2.bst
- filename: components/glib.bst
- filename: components/itstool.bst
  type: build

sources:
- kind: git_tag
  url: freedesktop:xdg/shared-mime-info.git
  track: master
  track-extra:
  - Release-1-14
  ref: Release-1-14-0-g66ae46cbaf40579a4686b9793dc19b731bbbc85e
