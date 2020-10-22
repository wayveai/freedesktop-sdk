kind: make

build-depends:
- components/pkg-config.bst
- components/go.bst
- components/go-md2man.bst

depends:
- components/libseccomp.bst
- components/systemd-libs.bst
- components/gpgme.bst
- bootstrap-import.bst

runtime-depends:
- components/conmon.bst
- components/cni.bst
- components/crun.bst
- components/slirp4netns.bst
- components/fuse-overlayfs.bst
- components/iptables.bst
- components/podman-config.bst

environment:
  GOPATH: "%{build-root}"

variables:
  ldflags_defaults: ""
  optimize-debug: "false"
  compress-debug: "false"
  command-subdir: src/github.com/containers/podman

sources:
- kind: git_tag
  url: github:containers/podman.git
  directory: src/github.com/containers/podman
  track: master
  track-extra:
  - v2.0
  ref: v2.0.4-0-gcab27868766a3b01ac14ff46180af8644c41d1cd
- kind: patch
  path: patches/podman/podman-stdin.patch
  directory: src/github.com/containers/podman
