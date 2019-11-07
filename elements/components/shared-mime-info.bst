kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: components/libxml2.bst
- filename: components/glib.bst
- filename: components/itstools.bst
  type: build

sources:
- kind: git_tag
  url: freedesktop:xdg/shared-mime-info.git
  track: master
  track-extra:
  - Release-1-15
  ref: Release-1-15-0-g829b26d85e7d89a0caee03046c3bce373f04c80a
