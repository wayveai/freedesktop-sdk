kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: components/gdbm.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: components/git-minimal.bst
  type: build

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libpipeline.so'

sources:
- kind: git_tag
  url: savannah:libpipeline.git
  track: master
  ref: 1.5.1-0-ga399d471273820b1a8eb3ecf2d91254011445c2a
- kind: git_tag
  url: savannah:gnulib.git
  track: master
  track-tags: false
  directory: gnulib
  ref: v0.1-2782-gd60d9c02609016e91ad349fad6fb46ee2472e768
