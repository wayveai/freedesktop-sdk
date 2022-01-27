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
  ref: v6.0-0-g19ff9a507b2601d46162ecb176ddffd1f8b01354
- kind: git_tag
  url: savannah:gnulib.git
  track: v0.1-2785-gc01635497d830f181a2607279135b3fff041b936
  track-tags: false
  directory: gnulib
  ref: v0.1-2785-gc01635497d830f181a2607279135b3fff041b936
