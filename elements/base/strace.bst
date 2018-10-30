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
  ref: 9a7661cc6223e0297183f92bc1f3c4943498c413   # 4.23
