kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- bootstrap-import.bst

sources:
- kind: git_tag
  url: http://git.netfilter.org/libmnl
  track: master
  ref: libmnl-1.0.4-0-g0930a63252958f40bb0f9d09de86985c25cea039
