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
  exclude:
  - '*beta*'
  ref: v1.1.11-0-g368e69ccc074628d17a9bb9a35b8f4b9f74db4c6
