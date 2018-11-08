kind: autotools
description: GNU C Library

depends:
- filename: glibc-build-deps.bst
  type: build
- filename: linux-headers.bst
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
    # Move /lib* links into the prefix.
    - |
      root="%{install-root}"
      for i in lib lib32 lib64; do
        libdir="${root}/${i}"
        targetdir="${root}%{prefix}/${i}"
        if [ -d "${libdir}" ]; then
          for f in "${libdir}"/*; do
            if [ -h "$f" ]; then
              [ -d "${targetdir}" ] || mkdir -p "${targetdir}"
              targetpath="${targetdir}/$(basename "$f")"
              sourcepath="${libdir}/$(readlink "$f")"
              relsourcepath="$(realpath "${sourcepath}" --relative-to="${targetdir}")"
              ln -s "${relsourcepath}" "${targetpath}"
              rm "$f"
            fi
          done
          rm -r "${libdir}"
          ln -s "$(realpath "${targetdir}" --relative-to="${root}")" "${libdir}"
        fi
      done

(@): target.yml

variables:
  multiarch_libdir: '%{prefix}/lib/%{gcc_triplet}'
  lib: lib

  # -D_FORTIFY_SOURCE=2 breaks building glibc
  target_common_flags: "%{common_flags} -Wp,-D_GLIBCXX_ASSERTIONS -fexceptions -fstack-protector-strong -grecord-gcc-switches"
  arch_options: ''
  (?):
    - target_arch == "i686" or target_arch == "x86_64" or target_arch == "aarch64":
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
    %{arch_options}

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/*.o'
        - '%{libdir}/libdl.so'
        - '%{libdir}/libnsl.so'
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
      - 'CVE-2017-18269'
      - 'CVE-2018-11236'
      - 'CVE-2018-11237'
      - 'CVE-2018-19591'

sources:
- kind: git_tag
  url: sourceware:glibc.git
  track: release/2.27/master
  ref: 2.27-99-gf6d0e8c36f02b387d33f2cc58c7cb204f201d92e
