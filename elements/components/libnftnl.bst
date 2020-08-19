kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- components/libmnl.bst

sources:
- kind: git_tag
  url: netfilter:libnftnl
  track: master
  ref: libnftnl-1.1.7-0-geedafeb6db330b8adff1b7cdd3dac325f9144195
