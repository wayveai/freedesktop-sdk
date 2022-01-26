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
  ref: v5.16-0-g69f66eb864ffa547eda77fa594c4b612b800e8ea
