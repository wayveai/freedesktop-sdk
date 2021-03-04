kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: components/libunwind-maybe.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build

variables:
  conf-local: --enable-mpers=check

sources:
- kind: git_tag
  url: github:strace/strace.git
  track: master
  ref: v5.10-0-g5097662f250d4d8558ccaa54684738c752724c08
