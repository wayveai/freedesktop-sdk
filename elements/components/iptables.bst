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
  ref: v1.8.5-0-g14ac250946289e280fb09ef978a45042871275b0
