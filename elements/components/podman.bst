kind: manual

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

environment:
  GOPATH: "%{build-root}"

variables:
  ldflags_defaults: ""
  optimize-debug: "false"

config:
  build-commands:
  - |
    cd src/github.com/containers/podman
    make

  install-commands:
  - |
    cd src/github.com/containers/podman
    make DESTDIR="%{install-root}" PREFIX="%{prefix}" install

  - |
    install -Dm644 registries/registries.conf "%{install-root}%{sysconfdir}/containers/registries.conf"

  - |
    cat <<EOF >policy.json
    {
      "default": [{"type": "insecureAcceptAnything"}],
      "transports": {}
    }
    EOF
    install -Dm644 policy.json "%{install-root}%{sysconfdir}/containers/policy.json"

sources:
- kind: git_tag
  url: github:containers/podman.git
  directory: src/github.com/containers/podman
  track: master
  ref: v2.0.0-rc7-0-g5460ea87d48ea6c10a5ef3c753c57e27b3356aae
- kind: patch
  path: patches/podman/podman-stdin.patch
  directory: src/github.com/containers/podman
- kind: git_tag
  url: github:projectatomic/registries.git
  directory: registries
  ref: da9a9c87781823f45401ca49da04e269c9e3100e
