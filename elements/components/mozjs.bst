kind: manual

build-depends:
- components/autoconf2.13.bst # 1999 called, LOL
- components/pkg-config.bst
- components/python3.bst
- components/which.bst
- components/perl.bst
- components/rust.bst
- enable-shm.bst

depends:
- components/nspr.bst
- components/icu.bst

environment-nocache:
- MAXJOBS

environment:
  MACH_USE_SYSTEM_PYTHON: '1'
  MAXJOBS: '%{max-jobs}'
  PATH: /usr/bin:/usr/lib/sdk/rust/bin
  CC: gcc
  CXX: g++

variables:
  optimize-debug: "false"

config:
  configure-commands:
  - |
    cat >mozconfig <<EOF
    ac_add_options --prefix="%{prefix}"
    ac_add_options --libdir="%{libdir}"
    ac_add_options --host="%{build-triplet}"
    ac_add_options --target="%{host-triplet}"
    ac_add_options --enable-application=js
    ac_add_options --enable-release
    ac_add_options --with-system-nspr
    ac_add_options --with-system-zlib
    ac_add_options --with-system-icu
    ac_add_options --enable-readline
    ac_add_options --disable-jemalloc
    mk_add_options MOZ_OBJDIR=@TOPSRCDIR@/build-dir
    EOF

  - |
    ./mach configure

  build-commands:
  - |
    ./mach build -j${MAXJOBS} --verbose

  install-commands:
  - |
    cd build-dir && make -j1 install DESTDIR="%{install-root}"

  - rm -rf "%{install-root}%{bindir}"
  - rm "%{install-root}%{libdir}/libjs_static.ajs"

sources:
- kind: tar
  url: tar_https:ftp.mozilla.org/pub/firefox/releases/91.5.0esr/source/firefox-91.5.0esr.source.tar.xz
  base-dir: 'firefox-91.5.0'
  ref: f45cd9c96227e3e6eabe37962ce924b7a7ca86b6c191326c1bab18e082b4c813
