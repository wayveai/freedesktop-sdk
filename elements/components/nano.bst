kind: autotools
description: GNU nano

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: components/texinfo.bst
  type: build

config:
  install-commands:
    (>):
    - rm "%{install-root}/usr/share/info/dir"

sources:
- kind: git_tag
  url: savannah:nano.git
  track: master
  ref: v6.1-0-ge4ecd03e3fe682ab77667754e1fc76fd9bcccbad
- kind: git_tag
  url: savannah:gnulib.git
  track: v0.1-2785-gc01635497d830f181a2607279135b3fff041b936
  track-tags: false
  directory: gnulib
  ref: v0.1-2785-gc01635497d830f181a2607279135b3fff041b936
