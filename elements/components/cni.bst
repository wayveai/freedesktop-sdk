kind: manual

build-depends:
- components/pkg-config.bst
- components/git-minimal.bst
- components/go.bst
- components/go-md2man.bst

depends:
- bootstrap-import.bst

environment:
  GOPATH: "%{build-root}"

variables:
  ldflags_defaults: ""
  optimize-debug: "false"
  compress-debug: "false"
  command-subdir: src/github.com/containernetworking/plugins

config:
  build-commands:
  - |
    ./build_linux.sh

  install-commands:
  - |
    install -Dm755 -t "%{install-root}%{libexecdir}/cni" bin/*

sources:
- kind: git_tag
  url: github:containernetworking/plugins.git
  directory: src/github.com/containernetworking/plugins
  track: main
  exclude:
  - "*rc*"
  ref: v1.1.0-0-g26745d375201a7e4851d2eb40aa6f2bb2bc0bb61
