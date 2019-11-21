kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build

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
  ref: v2.4.1-0-gfb43972ea1aab24f2a70193fb7445c2674f594e3
- kind: patch
  path: patches/libseccomp/no-static.patch
