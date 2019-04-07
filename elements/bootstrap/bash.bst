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
    ac_cv_rl_version=8.0 \
    bash_cv_getcwd_malloc=yes \
    bash_cv_job_control_missing=present \
    bash_cv_termcap_lib=libtinfo

config:
  build-commands:
    (<):
    # The current build tries to build "build" binaries with "host"
    # include directories. So it does not find the right headers.
    # Those tools are source code generators. We build them first
    # disabling that some include directories.
    - |
      cd "%{builddir}"
      make RL_INCLUDEDIR=/non-existant mksyntax bashversion mksignames recho zecho printenv xcase
      make RL_INCLUDEDIR=/non-existant -C builtins mkbuiltins psize.aux

  install-commands:
    (>):
    - |
      ln -s bash "%{install-root}%{bindir}/sh"

    - |
      rm "%{install-root}%{infodir}/dir"

public:
  cpe:
    vendor: 'gnu'
    version: '5.0.0'

sources:
- kind: git_tag
  url: savannah:bash.git
  track: master
  ref: bash-5.0-0-gd233b485e83c3a784b803fb894280773f16f2deb
