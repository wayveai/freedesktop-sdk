kind: manual

build-depends:
- components/go.bst

depends:
- bootstrap-import.bst

environment:
  GOPATH: "%{build-root}/go"

variables:
  optimize-debug: "false"

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
  ref: v2.0.0-0-gf79a8a8ca69da163eee19ab442bedad7a35bba5a
