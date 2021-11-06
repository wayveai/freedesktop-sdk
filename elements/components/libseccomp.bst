kind: autotools

build-depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-autotools.bst
- filename: components/gperf.bst

runtime-depends:
- filename: bootstrap-import.bst

variables:
  builddir: ''

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libseccomp.so'

sources:
- kind: git_tag
  url: github:seccomp/libseccomp.git
  track: release-2.5
  ref: v2.5.3-0-g57357d2741a3b3d3e8425889a6b79a130e0fa2f3
