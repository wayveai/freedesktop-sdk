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
  track: master
  ref: 0.17-0-g0e9229ae34caaebcb86f1fde18de3acaf18c6d9a
- kind: git_tag
  url: github:containers/libocispec.git
  directory: libocispec
  submodules:
    runtime-spec:
      url: github:opencontainers/runtime-spec.git
      checkout: true
    image-spec:
      url: github:opencontainers/image-spec.git
      checkout: true
  # FIXME: this should be a submodule, but git_tag does not seem to support
  # multiple levels of submodules
  ref: df96ab4041005d8bc491c1c1f63fedbf28caf9ee
