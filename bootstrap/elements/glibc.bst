kind: autotools
description: GNU C Library

depends:
- filename: dependencies/base-sdk.bst
  type: build
- filename: gnu-config.bst
  type: build
- filename: linux-headers.bst
  type: build
- filename: gcc-stage1.bst
  type: build
- filename: binutils-stage1.bst
  type: build
- filename: debugedit-host.bst
  type: build

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
  - |
    cd "%{builddir}"
    %{cross-install}

# Because sysconfdir has to be set as /etc for ldconfig, we need
# manually move /etc/rpc
  - |
    mkdir -p "%{install-root}%{sysroot}%{prefix}/etc"
    mv "%{install-root}%{sysroot}%{sysconfdir}/rpc" "%{install-root}%{sysroot}%{prefix}/etc/rpc"
    rm -r "%{install-root}%{sysroot}%{sysconfdir}"

# Move /lib* links into the prefix.
  - |
    root="%{install-root}%{sysroot}"
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

  - |
    %{delete_libtool_files}

variables:
  # flatpak places ld.so.conf in /etc and not /usr/etc.
  sysconfdir: /etc

  multiarch_libdir: '%{prefix}/lib/%{gcc_triplet}'
  lib: lib

  host-triplet: '%{triplet}'
  build-triplet: '%{guessed-triplet}'
  # -D_FORTIFY_SOURCE=2 breaks building glibc
  common_flags: "-O2 -g -pipe -Wp,-D_GLIBCXX_ASSERTIONS -fexceptions -fstack-protector-strong -grecord-gcc-switches"
  arch_options: ''
  (?):
    - target_arch == "i686" or target_arch == "x86_64" or target_arch == "aarch64":
        arch_options: "--enable-static-pie"
    - target_arch == "arm":
    # --enable-static-pie breaks arm build
        arch_options: ""

  conf-local: |
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
        - '%{sysroot}%{libdir}/*.o'
        - '%{sysroot}%{libdir}/lib*.a'
        - '%{sysroot}%{libdir}/libdl.so'
        - '%{sysroot}%{libdir}/libnsl.so'
        - '%{sysroot}%{libdir}/libBrokenLocale.so'
        - '%{sysroot}%{libdir}/libthread_db.so'
        - '%{sysroot}%{libdir}/librt.so'
        - '%{sysroot}%{libdir}/libcrypt.so'
        - '%{sysroot}%{libdir}/libnss_dns.so'
        - '%{sysroot}%{libdir}/libanl.so'
        - '%{sysroot}%{libdir}/libnss_files.so'
        - '%{sysroot}%{libdir}/libresolv.so'
        - '%{sysroot}%{libdir}/libmvec.so'
        - '%{sysroot}%{libdir}/libcidn.so'
        - '%{sysroot}%{libdir}/libnss_hesiod.so'
        - '%{sysroot}%{libdir}/libnss_db.so'
        - '%{sysroot}%{libdir}/libutil.so'
        - '%{sysroot}%{libdir}/libnss_compat.so'
        - '%{sysroot}%{libdir}/libm.so'

sources:
- kind: git_tag
  url: http://sourceware.org/git/glibc.git
  track: master
  ref: glibc-2.27-0-g23158b08a0908f381459f273a984c6fd328363cb
- kind: patch
  path: patches/glibc-reorder-end.patch
