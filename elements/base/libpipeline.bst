kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: base/gdbm.bst
- filename: base/buildsystem-autotools.bst
  type: build
- filename: base/git-minimal.bst
  type: build

config:
  configure-commands:
    (<):
    - cp -r gnulib-files/build-aux gnulib/

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
  ref: 1.5.0-0-g5b44863995788f76011092493e24a046888cbfb7
- kind: git_tag
  url: savannah:gnulib.git
  track: master
  track-tags: false
  directory: gnulib-files
  ref: v0.1-2751-gb417a9c02359cd1e9ed215e0896b36dd383fc47f
