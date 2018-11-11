kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: base/bison.bst
  type: build
- filename: base/buildsystem-autotools.bst
  type: build


sources:
- kind: git_tag
  url: git_savannah_gnu_org:patch.git
  track: master
  ref: v2.7.6-0-g40b387de08653a1e46872b8ac1a6a14b9b94feb3
