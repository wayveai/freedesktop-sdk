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
  ref: 1.4.4-0-g6521fcc5806f20f6187eb933f9f45130c86da230
- kind: git_module
  path: libocispec
  url: github:containers/libocispec.git
  ref: ace546f0a9c82c1878b93a43dab414d41da20821
- kind: git_module
  path: runtime-spec
  url: github:opencontainers/runtime-spec.git
  directory: libocispec
  ref: a3c33d663ebc56c4d35dbceaa447c7bf37f6fab3
- kind: git_module
  path: image-spec
  url: github:opencontainers/image-spec.git
  directory: libocispec
  ref: 693428a734f5bab1a84bd2f990d92ef1111cd60c
- kind: git_module
  path: yajl
  url: github:containers/yajl.git
  directory: libocispec
  ref: f344d21280c3e4094919fd318bc5ce75da91fc06
