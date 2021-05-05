kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: components/libdatrie.bst
- filename: components/git-minimal.bst
  type: build
- filename: public-stacks/buildsystem-autotools.bst
  type: build

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libthai.so'

sources:
- kind: git_tag
  url: github:tlwg/libthai.git
  track: master
  ref: v0.1.28-0-g3db9d05dc9316e38feb531bee52787dee0aa198d
- kind: patch
  path: patches/libthai/autoconf-fix.patch
