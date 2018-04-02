kind: autotools
description: GNU C Library

depends:
- filename: dependencies/base-sdk.bst
  type: build
- filename: dependencies/config.bst
  type: build
- filename: linux-headers.bst
  type: build
- filename: gcc-stage1.bst
  type: build
- filename: binutils-stage1.bst
  type: build


config:
  configure-commands:
    - |
      mkdir "%{builddir}"
      cd "%{builddir}"
      echo slibdir=%{libdir} >configparms
      echo gconvdir=%{libdir}/gconv >>configparms
      echo rootsbindir=%{sbindir} >>configparms
      echo sbindir=%{sbindir} >>configparms
      ../configure \
      --host=%{triplet} \
      --build=$(sh /config/config.guess) \
      --prefix=%{prefix} \
      --with-headers=%{sysroot}%{includedir}

  install-commands:
    - |
      cd "%{builddir}"
      %{cross-install}

    - |
      %{delete_libtool_files}

environment:
  CPPFLAGS: ""
  CFLAGS: "-O2 -g"
  CXXFLAGS: "-O2 -g"
  LDFLAGS: ""

variables:
  stdlib: "%{prefix}/lib"
  (?):
    - target_arch == "x86_64" or target_arch == "aarch64":
        stdlib: "%{prefix}/lib64"

public:
  bst:
    split-rules:
      devel:
        (>):
          - "%{sysroot}%{stdlib}/*.o"
          - "%{sysroot}%{stdlib}/lib*.a"
          - "%{sysroot}%{stdlib}/libdl.so"
          - "%{sysroot}%{stdlib}/libnsl.so"
          - "%{sysroot}%{stdlib}/libBrokenLocale.so"
          - "%{sysroot}%{stdlib}/libthread_db.so"
          - "%{sysroot}%{stdlib}/librt.so"
          - "%{sysroot}%{stdlib}/libcrypt.so"
          - "%{sysroot}%{stdlib}/libnss_dns.so"
          - "%{sysroot}%{stdlib}/libanl.so"
          - "%{sysroot}%{stdlib}/libnss_files.so"
          - "%{sysroot}%{stdlib}/libresolv.so"
          - "%{sysroot}%{stdlib}/libmvec.so"
          - "%{sysroot}%{stdlib}/libcidn.so"
          - "%{sysroot}%{stdlib}/libnss_hesiod.so"
          - "%{sysroot}%{stdlib}/libnss_db.so"
          - "%{sysroot}%{stdlib}/libutil.so"
          - "%{sysroot}%{stdlib}/libnss_compat.so"
          - "%{sysroot}%{stdlib}/libm.so"

sources:
- kind: tar
  url: http://ftp.gnu.org/gnu/glibc/glibc-2.27.tar.xz
  ref: 5172de54318ec0b7f2735e5a91d908afe1c9ca291fec16b5374d9faadfc1fc72
- kind: patch
  path: patches/glibc-reorder-end.patch
