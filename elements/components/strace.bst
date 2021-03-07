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
  ref: v5.11-0-gcdda3034d81dec541733d95748c91057aff1e3ec
