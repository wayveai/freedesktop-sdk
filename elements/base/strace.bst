kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: base/libunwind.bst
- filename: base/buildsystem-autotools.bst
  type: build

variables:
  conf-local: --enable-mpers=check

sources:
- kind: git_tag
  url: github:strace/strace.git
  track: master
  ref: v4.26-0-g27739ebccc96c0f70cd2aeb37fd7b0ecfef21724
