kind: manual

build-depends:
- components/pkg-config.bst
- components/git.bst
- components/go.bst
- components/go-md2man.bst

depends:
- components/glib.bst

environment:
  GOPATH: "%{build-root}"

variables:
  ldflags_defaults: ""
  optimize-debug: "false"

config:
  build-commands:
  - |
    cd src/github.com/containers/conmon
    make

  install-commands:
  - |
    cd src/github.com/containers/conmon
    make DESTDIR="%{install-root}" PREFIX="%{prefix}" install

sources:
- kind: git_tag
  url: github:containers/conmon.git
  directory: src/github.com/containers/conmon
  track: master
  ref: v2.0.20-0-g13244db638cf987c415298a3c23393ae5abeb885
