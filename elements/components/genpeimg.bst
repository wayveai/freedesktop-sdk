kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- bootstrap-import.bst

variables:
  conf-cmd: mingw-w64-tools/genpeimg/configure

sources:
- kind: git_tag
  url: https://git.code.sf.net/p/mingw-w64/mingw-w64.git
  track: master
  track-extra:
  - v7.x
  ref: v7.0.0-0-g5eece15a2eb2e97da10d1e8cf5ff46e72b3bd768
