kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- bootstrap-import.bst

variables:
  conf-cmd: mingw-w64-tools/genpeimg/configure

sources:
- kind: git_tag
  url: sourceforge_git:mingw-w64/mingw-w64.git
  track: master
  track-extra:
  - v7.x
  ref: v9.0.0-0-gacc9b9d9eb63a13d8122cbac4882eb5f4ee2f679
