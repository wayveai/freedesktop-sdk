kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: base/buildsystem-autotools.bst
  type: build

config:
  configure-commands:
    # We need this hack to not build the docs
    (<):
    - |
      sed -i 's/AC_CONFIG_SUBDIRS(\[lib src tests doc\])/AC_CONFIG_SUBDIRS(\[lib src tests\])/' configure.ac
      sed -i '45d;46d;47d;48d;49d' configure.ac

sources:
- kind: git_tag
  url: savannah:gperf.git
  track: master
  ref: v3.1-0-g165bba235b2e3289967e505411500e08151f63e9
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
