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
  ref: v5.0-0-gc561b4280ffd9441fd1b0d9d45020d08e0d0fcc8
- kind: git_tag
  url: savannah:gnulib.git
  track: v0.1-2785-gc01635497d830f181a2607279135b3fff041b936
  track-tags: false
  directory: gnulib
  ref: v0.1-2785-gc01635497d830f181a2607279135b3fff041b936
