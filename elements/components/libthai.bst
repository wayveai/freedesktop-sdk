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
  # 0.1.29 requires autoconf 2.71
  ref: v0.1.28-0-g3db9d05dc9316e38feb531bee52787dee0aa198d
