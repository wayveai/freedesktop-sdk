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
  ref: v0.1.29-0-g618e442c340cff089f29743d35392a6aba21a9fb
- kind: patch
  path: patches/libthai/autoconf-fix.patch
