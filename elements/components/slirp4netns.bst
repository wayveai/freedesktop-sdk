kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- components/glib.bst
- components/libslirp.bst
- components/libcap.bst
- components/libseccomp.bst

sources:
- kind: git_tag
  url: github:rootless-containers/slirp4netns.git
  track: master
  ref: v1.1.4-0-gb66ffa8e262507e37fca689822d23430f3357fe8
