kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: base/gdbm.bst

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
- kind: remote
  url: https://git.savannah.gnu.org/cgit/gnulib.git/plain/build-aux/install-sh
  ref: 618b9afe95659e12966f090232b2e713946f1c162915c8385dfff71f34eacd58
  directory: build-aux
- kind: remote
  url: https://git.savannah.gnu.org/cgit/gnulib.git/plain/build-aux/mkinstalldirs
  ref: 9e1766ed7a2acebb516f51968a67090d40e61496e7e6d407c336b824d3f11c65
  directory: build-aux
- kind: remote
  url: https://git.savannah.gnu.org/cgit/gnulib.git/plain/build-aux/compile
  ref: cf686b3cb1f8f8ffc4f0295671f2fce476f6187e98a456dd2b71ec0c1d2a407c
  directory: build-aux
- kind: remote
  url: https://git.savannah.gnu.org/cgit/gnulib.git/plain/build-aux/ar-lib
  ref: cec2bc0d29c0761f9b535cdb3b6f9ddd8b8732d1130d71904be1e950498d9bb1
  directory: build-aux
