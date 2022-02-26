kind: make

build-depends:
- components/pkg-config.bst
- components/git.bst
- components/go.bst
- components/go-md2man.bst
- components/systemd.bst

depends:
- components/glib.bst
- components/systemd-libs.bst

environment:
  GOPATH: "%{build-root}"

variables:
  ldflags_defaults: ""
  optimize-debug: "false"
  compress-debug: "false"
  command-subdir: src/github.com/containers/conmon

sources:
- kind: git_tag
  url: github:containers/conmon.git
  directory: src/github.com/containers/conmon
  track: main
  ref: v2.0.29-0-g7e6de6678f6ed8a18661e1d5721b81ccee293b9b
