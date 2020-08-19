kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/git-minimal.bst

depends:
- components/glib.bst

sources:
- kind: git_tag
  url: freedesktop:slirp/libslirp.git
  track: master
  ref: v4.3.1-0-ga62d36734ffe9828d0f70df1b3898a3b4fbda755
