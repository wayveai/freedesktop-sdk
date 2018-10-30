kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: base/bison.bst
  type: build
- filename: base/buildsystem-autotools.bst
  type: build


sources:
- kind: git_tag
  url: https://git.savannah.gnu.org/git/patch.git
  track: master
  ref: 40b387de08653a1e46872b8ac1a6a14b9b94feb3   # v2.7.6
