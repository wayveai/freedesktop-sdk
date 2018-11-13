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
  ref: v4.25-0-gc12d2de112d1f32a0a6ed00a8dc483fbb5596bfc
