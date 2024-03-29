kind: autotools
description: GNU coreutils

build-depends:
- bootstrap/coreutils-build-deps.bst

runtime-depends:
- bootstrap/acl.bst
- bootstrap/libselinux.bst

(@):
- elements/bootstrap/include/target.yml
- elements/bootstrap/include/coreutils-source.yml

environment:
  FORCE_UNSAFE_CONFIGURE: "1"

variables:
  conf-local: >-
    --enable-install-program=hostname,arch
    --enable-no-install-program=kill,uptime,groups
    --enable-acl
    ac_cv_func_chown_works=yes
    gl_cv_func_chown_slash_works=yes
    gl_cv_func_chown_ctime_works=yes
    gl_cv_func_chown_follows_symlink=yes

  make-install: make -j1 install DESTDIR="%{install-root}" INSTALL=install

config:
  build-commands:
    (<):
    - |
      mkdir -p "%{build-dir}/man"
      cp /coreutils-manpages/man1/* "%{build-dir}/man/"

  install-commands:
    (>):
    - |
      rm "%{install-root}%{infodir}/dir"

sources:
  (>):
  - kind: patch
    path: patches/coreutils/coreutils-no-man-deps.patch
