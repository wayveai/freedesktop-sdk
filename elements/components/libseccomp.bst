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
  ref: v2.4.3-0-g1dde9d94e0848e12da20602ca38032b91d521427
- kind: patch
  path: patches/libseccomp/no-static.patch
