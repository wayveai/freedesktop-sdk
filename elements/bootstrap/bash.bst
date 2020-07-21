kind: autotools
description: GNU Bash

depends:
- filename: bootstrap/bash-build-deps.bst
  type: build
- filename: bootstrap/readline.bst
  type: runtime

(@): elements/bootstrap/include/target.yml

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

    - |
      rm "%{install-root}%{infodir}/dir"

    - |
      mkdir -p "%{install-root}%{includedir}/%{gcc_triplet}/bash"
      mv "%{install-root}%{includedir}/bash/config.h" "%{install-root}%{includedir}/%{gcc_triplet}/bash/"
      mv "%{install-root}%{includedir}/bash/signames.h" "%{install-root}%{includedir}/%{gcc_triplet}/bash/"

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/bash/loadables.h'
        - '%{libdir}/bash/Makefile.inc'

  cpe:
    vendor: 'gnu'
    patches:
    - CVE-2019-18276

sources:
- kind: git_tag
  url: savannah:bash.git
  track: master
  track-tags: false
  ref: bash-5.0-18-g36f2c406ff27995392a9247dfa90672fdaf7dc43
- kind: patch
  path: patches/bash/CVE-2019-18276.patch
