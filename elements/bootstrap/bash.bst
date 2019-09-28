kind: autotools
description: GNU Bash

depends:
- filename: bootstrap/bash-build-deps.bst
  type: build
- filename: bootstrap/readline.bst
  type: runtime

(@): elements/bootstrap/target.yml

variables:
  # bash_cv_termcap_lib is for working around undetected of libtinfo
  # because termcap is detected
  conf-local: |
    --with-curses \
    --with-installed-readline="%{sysroot}%{prefix}" \
    --enable-job-control \
    --without-bash-malloc \
    ac_cv_rl_version=7.0 \
    bash_cv_getcwd_malloc=yes \
    bash_cv_job_control_missing=present \
    bash_cv_termcap_lib=libtinfo

config:
  build-commands:
    # The current build tries to build "build" binaries with "host"
    # include directories. So it does not find the right headers.
    # Those tools are source code generators. We build them first
    # disabling that some include directories.
    (<):
    - |
      cd "%{builddir}"
      make RL_INCLUDEDIR=/non-existant mksyntax bashversion mksignames recho zecho printenv xcase
      make RL_INCLUDEDIR=/non-existant -C builtins mkbuiltins psize.aux

  install-commands:
    (>):
    - |
      ln -s bash "%{install-root}%{bindir}/sh"

public:
  cpe:
    vendor: 'gnu'
    version: '4.4.19'

sources:
- kind: git_tag
  url: savannah:bash.git
  track: master
  ref: bash-4.4-19-gb0776d8c49ab4310fa056ce1033985996c5b9807
