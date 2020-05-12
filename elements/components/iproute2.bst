kind: make

build-depends:
- components/bison.bst
- components/flex.bst

sources:
- kind: git_tag
  url: kernel:network/iproute2/iproute2.git
  track: master
  ref: v5.6.0-0-g29981db0e051cd4c53920c89dddcf3d883343a0f
