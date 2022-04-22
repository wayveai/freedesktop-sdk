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
  ref: v2.5.4-0-gf33f95014b36f97b42f0c2290e96d5c31647ed10
