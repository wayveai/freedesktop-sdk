kind: manual

build-depends:
- components/go.bst

depends:
- bootstrap-import.bst

environment:
  GOPATH: "%{build-root}/go"
  GO111MODULE: auto

variables:
  optimize-debug: "false"
  compress-debug: "false"

config:
  build-commands:
  - |
    go build github.com/cpuguy83/go-md2man

  install-commands:
  - |
    go install github.com/cpuguy83/go-md2man

  - |
    install -Dm755 -t "%{install-root}%{bindir}" "${GOPATH}/bin"/*

sources:
- kind: git_tag
  url: github:cpuguy83/go-md2man.git
  directory: go/src/github.com/cpuguy83/go-md2man
  track: master
  ref: v2.0.1-0-gb1ec32e02fe539480dc03e3bf381c20066e7c6cc
