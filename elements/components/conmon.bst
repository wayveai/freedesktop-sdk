kind: make

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
  compress-debug: "false"
  command-subdir: src/github.com/containers/conmon

sources:
- kind: git_tag
  url: github:containers/conmon.git
  directory: src/github.com/containers/conmon
  track: master
  ref: v2.0.27-0-g65fad4bfcb250df0435ea668017e643e7f462155
