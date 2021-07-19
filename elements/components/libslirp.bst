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
  ref: v4.6.1-0-gcceced0cce9d578ed01db68edf31af78eb66f858
