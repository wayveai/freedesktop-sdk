kind: manual

build-depends:
- components/autoconf2.13.bst # 1999 called, LOL
- components/pkg-config.bst
- components/python3.bst
- components/which.bst
- components/perl.bst
- components/rust.bst

depends:
- components/nspr.bst
- components/icu.bst

environment-nocache:
- MAXJOBS

environment:
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
  url: tar_https:ftp.mozilla.org/pub/firefox/releases/78.12.0esr/source/firefox-78.12.0esr.source.tar.xz
  base-dir: 'firefox-78.12.0'
  ref: 8b55a8b8254ddde03db83f44c9fecfc4ae86ea126b5445a0355d915830bd7410
- kind: patch
  path: patches/mozjs/fix-arm-build.patch
- kind: patch
  path: patches/mozjs/0001-Add-riscv64-as-target-architecture-to-mozbuild.patch
- kind: patch
  path: patches/mozjs/0002-js-jit-Enable-AtomicOperations-feeling-lucky.h-on-ri.patch
- kind: patch
  path: patches/mozjs/0003-mfbt-tests-Define-RETURN_INSTR-for-riscv64-in-TestPo.patch
- kind: patch
  path: patches/mozjs/0001-Use-correct-ABI-when-building-on-Linux-for-64-bit.patch
