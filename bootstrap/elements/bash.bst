kind: autotools
description: GNU Bash

depends:
- filename: dependencies/base-sdk.bst
  type: build
- filename: gnu-config.bst
  type: build
- filename: linux-headers.bst
  type: build
- filename: gcc-stage2.bst
  type: build
- filename: binutils-stage1.bst
  type: build
- filename: glibc.bst
  type: build
- filename: ncurses.bst
  type: build
- filename: readline.bst
  type: build
- filename: cross-installation-links.bst
  type: build
- filename: debugedit-host.bst
  type: build

variables:
  build-triplet: "%{guessed-triplet}"
  host-triplet: "%{triplet}"
  # bash_cv_termcap_lib is for working around undetected of libtinfo
  # because termcap is detected
  conf-local: |
    --with-curses \
    --with-installed-readline="/readline-separate-install%{prefix}" \
    --enable-job-control \
    --without-bash-malloc \
    ac_cv_rl_version=7.0 \
    bash_cv_getcwd_malloc=yes \
    bash_cv_job_control_missing=present \
    bash_cv_termcap_lib=libtinfo

config:
  install-commands:
    - |
      cd "%{builddir}"
      %{cross-install}

    - |
      ln -s bash "%{install-root}%{sysroot}%{bindir}/sh"

    - |
      %{delete_libtool_files}

sources:
  - kind: tar
    url: ftp_gnu_org:bash/bash-4.4.18.tar.gz
    ref: 604d9eec5e4ed5fd2180ee44dd756ddca92e0b6aa4217bbab2b6227380317f23
