kind: autotools
description: GNU C Library

depends:
- filename: bootstrap/libstdc++-stage1-build-deps.bst
  type: build
- filename: bootstrap/glibc.bst
  type: runtime

(@):
- elements/bootstrap/target.yml

variables:
  # Does not compile with -D_FORTIFY_SOURCE=2
  target_common_flags: >-
    %{common_flags}
    -Wp,-D_GLIBCXX_ASSERTIONS
    -fexceptions
    -fstack-protector-strong
    -grecord-gcc-switches

  lib: lib

  conf-local: |
    --disable-nls \
    --disable-multilib

config:
  configure-commands:
  - |
    mkdir "%{builddir}"
    cd "%{builddir}"
    ../libstdc++-v3/%{configure}

sources:
- kind: tar
  url: ftp_gnu_org:gcc/gcc-8.3.0/gcc-8.3.0.tar.xz
  ref: 64baadfe6cc0f4947a84cb12d7f0dfaf45bb58b7e92461639596c21e02d97d2c
