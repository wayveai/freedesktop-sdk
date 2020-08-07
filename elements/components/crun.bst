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
  ref: 0.14.1-0-g88886aef25302adfd40a9335372bbc2b970c8ae5
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
  ref: 69a096a965ae47c5a83832b87e1d0a5178ca0b30
