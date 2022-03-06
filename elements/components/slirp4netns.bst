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
  ref: v1.1.12-0-g7a104a101aa3278a2152351a082a6df71f57c9a3
