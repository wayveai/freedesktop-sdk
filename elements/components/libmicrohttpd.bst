kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/texinfo.bst

depends:
- bootstrap-import.bst

sources:
- kind: git_tag
  url: git_https:git.gnunet.org/libmicrohttpd.git
  track: master
  exclude:
  - v0.9.71
  ref: v0.9.72-0-gf7c5c302a3ade612b4915ed1de6a7dfdffe143b5
