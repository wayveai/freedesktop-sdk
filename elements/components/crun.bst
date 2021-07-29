kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/systemd.bst
- components/python3.bst
- components/git-minimal.bst
- components/gperf.bst

depends:
- components/yajl.bst
- components/systemd-libs.bst
- components/libcap.bst
- components/libseccomp.bst
- bootstrap-import.bst

variables:
  builddir: ''

environment:
  (?):
  - target_arch == "riscv64":
      # incredibly racy on riscv64
      MAKEFLAGS: "-j1"

sources:
- kind: git_tag
  url: github:containers/crun.git
  track: main
  ref: 0.20.1-0-g38271d1c8d9641a2cdc70acfa3dcb6996d124b3d
- kind: git_module
  path: libocispec
  url: github:containers/libocispec.git
  ref: c9b8b9524814550a489aa6d38b2dec95633ffa15
- kind: git_module
  path: runtime-spec
  url: github:opencontainers/runtime-spec.git
  directory: libocispec
  ref: 9c848d91e8cf872e7453296832d66de6325e1e25
- kind: git_module
  path: image-spec
  url: github:opencontainers/image-spec.git
  directory: libocispec
  ref: 79b036d80240ae530a8de15e1d21c7ab9292c693
- kind: git_module
  path: yajl
  url: github:containers/yajl.git
  directory: libocispec
  ref: f344d21280c3e4094919fd318bc5ce75da91fc06
