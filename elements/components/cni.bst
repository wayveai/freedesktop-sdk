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

config:
  build-commands:
  - |
    cd src/github.com/containernetworking/plugins
    ./build_linux.sh

  install-commands:
  - |
    cd src/github.com/containernetworking/plugins
    install -Dm755 -t "%{install-root}%{libexecdir}/cni" bin/*

sources:
- kind: git_tag
  url: github:containernetworking/plugins.git
  directory: src/github.com/containernetworking/plugins
  track: master
  ref: v0.8.6-0-gad10b6fa91aacd720f1f9ab94341a97a82a24965
