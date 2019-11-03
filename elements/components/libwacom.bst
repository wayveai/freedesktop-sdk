kind: autotools

depends:
  - filename: bootstrap-import.bst
    type: build
  - filename: public-stacks/buildsystem-autotools.bst
    type: build
  - filename: components/glib.bst
  - filename: components/systemd.bst
  - filename: components/libgudev.bst

sources:
- kind: git_tag
  url: github:linuxwacom/libwacom.git
  track: master
  ref: libwacom-0.33-0-g87cc710e21a6220e267dd08936bbec2932aa3658
