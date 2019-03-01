kind: autotools
description: GNU C Library

depends:
- filename: bootstrap/glibc-build-deps.bst
  type: build
- filename: bootstrap/symlinks.bst
  type: runtime
- filename: bootstrap/linux-headers.bst
  type: runtime

config:
  configure-commands:
  - |
    mkdir "%{builddir}"
    cd "%{builddir}"

    echo slibdir=%{multiarch_libdir} >configparms
    echo gconvdir=%{multiarch_libdir}/gconv >>configparms
    echo rootsbindir=%{sbindir} >>configparms
    echo sbindir=%{sbindir} >>configparms
    ../%{configure}

  install-commands:
    (>):
    # Move the dynamic linker into the prefix
    - |
      rtlddir=$(echo '@libc_cv_rtlddir@' | %{builddir}/config.status --file=-)
      sourcedir="%{install-root}${rtlddir}"
      targetdir="%{install-root}%{prefix}${rtlddir}"

      for f in "${sourcedir}"/*; do
        if [ -h "$f" ]; then
          [ -d "${targetdir}" ] || mkdir -p "${targetdir}"
          targetpath="${targetdir}/$(basename "$f")"
          sourcepath="${sourcedir}/$(readlink "$f")"
          relsourcepath="$(realpath "${sourcepath}" --relative-to="${targetdir}")"

          ln -s "${relsourcepath}" "${targetpath}"
          rm "$f"
        fi
      done

      rm -r "${sourcedir}"

      if [ "${rtlddir}" != '/lib' ]; then
        ln -s "$(realpath "${targetdir}" --relative-to='%{install-root}')" "${sourcedir}"
      fi

    # ldconfig shows a warning if /etc/ld.so.conf doesn't exist
    - |
      touch '%{install-root}%{sysconfdir}/ld.so.conf'

(@): elements/bootstrap/target.yml

variables:
  multiarch_libdir: '%{prefix}/lib/%{gcc_triplet}'
  lib: lib

  # -D_FORTIFY_SOURCE=2 breaks building glibc
  target_common_flags: "%{common_flags} -Wp,-D_GLIBCXX_ASSERTIONS -fexceptions -fstack-protector-strong -grecord-gcc-switches"
  arch_options: ''
  (?):
    - target_arch == "i686" or target_arch == "x86_64":
        arch_options: "--enable-static-pie --enable-cet"
    - target_arch == "aarch64":
        arch_options: "--enable-static-pie"
    - target_arch == "arm":
    # --enable-static-pie breaks arm build
        arch_options: ""

  conf-local: |
    CFLAGS="$CFLAGS" \
    --with-headers=%{sysroot}%{includedir} \
    --enable-stackguard-randomization \
    --enable-stack-protector=strong \
    --enable-bind-now \
    --disable-werror \
    %{arch_options}

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/*.o'
        - '%{libdir}/libdl.so'
        - '%{libdir}/libnsl.so'
        - '%{libdir}/libpthread.so'
        - '%{libdir}/libBrokenLocale.so'
        - '%{libdir}/libthread_db.so'
        - '%{libdir}/librt.so'
        - '%{libdir}/libcrypt.so'
        - '%{libdir}/libnss_dns.so'
        - '%{libdir}/libanl.so'
        - '%{libdir}/libnss_files.so'
        - '%{libdir}/libresolv.so'
        - '%{libdir}/libmvec.so'
        - '%{libdir}/libcidn.so'
        - '%{libdir}/libnss_hesiod.so'
        - '%{libdir}/libnss_db.so'
        - '%{libdir}/libutil.so'
        - '%{libdir}/libnss_compat.so'
        - '%{libdir}/libm.so'

  cpe:
    patches:
      - 'CVE-2018-19591'

sources:
- kind: git_tag
  url: sourceware:glibc.git
  track: release/2.28/master
  ref: glibc-2.28-60-g4d7af7815af5217db6e8fde6032ddf4f6b2a4420
- kind: patch
  path: patches/glibc/0001-Revert-elf-Correct-absolute-SHN_ABS-symbol-run-time-.patch
