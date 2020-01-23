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
  ref: v2.4.2-0-g1b6cfd1fc0b7499a28c24299a93a80bd18619563
- kind: patch
  path: patches/libseccomp/no-static.patch
