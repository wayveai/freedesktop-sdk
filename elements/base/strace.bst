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
  url: https://github.com/strace/strace.git
  track: master
  ref: v4.24-0-g150655ca3e0f68f92dcb1e434301ac485aad5e15
