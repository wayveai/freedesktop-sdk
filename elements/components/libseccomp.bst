kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build

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
  track: release-2.4
  ref: v2.4.4-0-g8c76d7bb694a3f072c5f791c812bb4e2ea385f89
