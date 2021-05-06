kind: make

build-depends:
- components/pkg-config.bst
- components/go.bst
- components/go-md2man.bst
- components/git-minimal.bst

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
  - v3.1
  exclude:
  - "*rc*"
  ref: v3.1.2-0-g51b8ddbc22cf5b10dd76dd9243924aa66ad7db39
- kind: patch
  path: patches/podman/podman-stdin.patch
  directory: src/github.com/containers/podman
