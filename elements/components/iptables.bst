kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- components/libmnl.bst
- components/libnftnl.bst

sources:
- kind: git_tag
  url: netfilter:iptables
  track: master
  ref: v1.8.7-0-gf485d324e99fc9a9a7fe310b97e1ebf8114b36c6
