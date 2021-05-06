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

sources:
- kind: git_tag
  url: github:containers/crun.git
  track: master
  ref: 0.19.1-0-g1535fedf0b83fb898d449f9680000f729ba719f5
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
    yajl:
      url: github:containers/yajl.git
      checkout: true
  # FIXME: this should be a submodule, but git_tag does not seem to support
  # multiple levels of submodules
  ref: fa3e8338c62ae482e509884ee2edaefc8e00499e
