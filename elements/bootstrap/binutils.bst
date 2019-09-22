kind: autotools
description: GNU Binutils

depends:
- filename: bootstrap/binutils-build-deps.bst
  type: build
- filename: bootstrap/glibc.bst
  type: runtime
- filename: bootstrap/zlib.bst
  type: runtime

(@):
- elements/bootstrap/include/target.yml
- elements/bootstrap/include/binutils-source.yml

variables:
  # Disable '-fexceptions' which breaks build on arm.
  # https://gitlab.com/freedesktop-sdk/freedesktop-sdk/-/jobs/110741993
  # FIXME: what happens when we make it depend on gcc.bst? Does it it fix it?
  target_flags_exceptions: ''
  conf-local: |
    CFLAGS="${CFLAGS}" \
    --disable-werror \
    --with-lib-path="%{libdir}:%{indep-libdir}" \
    --enable-gold \
    --enable-ld=default \
    --enable-shared \
    --enable-plugins \
    --disable-gdb \
    --disable-sim \
    --disable-readline \
    --disable-libdecnumber \
    --enable-relro=yes \
    --enable-lto \
    --with-system-zlib \
    host_configargs='lt_cv_sys_lib_dlsearch_path_spec="/usr/lib/%{gcc_triplet}"'

config:
  install-commands:
    (>):
    - |
      if [ -e "%{install-root}%{prefix}/%{triplet}/bin/ld.bfd" ]; then
        rm "%{install-root}%{prefix}/%{triplet}/bin/ld"
        ln -s ld.bfd "%{install-root}%{prefix}/%{triplet}/bin/ld"
      fi

    - |
      for tool in "%{install-root}%{prefix}/%{triplet}/bin"/*; do
        toolbase="$(basename "${tool}")"
        for link in "%{bindir}/%{triplet}-${toolbase}" "%{bindir}/${toolbase}"; do
          if [ -f "%{install-root}${link}" ]; then
            rm "%{install-root}${link}"
            ln -s "$(realpath "${tool}" --relative-to="$(dirname "%{install-root}${link}")")" "%{install-root}${link}"
          fi
        done
      done

    - |
      rm "%{install-root}%{infodir}/dir"

environment:
  LEXLIB: ' '

public:
  bst:
    split-rules:
      runtime: []
      devel:
      - /**

  cpe:
    version: 2.32
    patches:
    - CVE-2018-1000876 # 2.32 tag already contains the fix https://sourceware.org/bugzilla/show_bug.cgi?id=23994#c2
    - CVE-2019-9071
    - CVE-2019-9070 # Same as CVE-2019-9071
    - CVE-2019-9073
    - CVE-2019-9074
    - CVE-2019-9075
    - CVE-2019-9077
    - CVE-2019-14250
    - CVE-2019-14444
    - CVE-2019-1010204
    - CVE-2019-12972
