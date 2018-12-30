kind: manual

depends:
- filename: bootstrap-import.bst
- filename: base/perl.bst
  type: build
- filename: base/nspr.bst
- filename: base/sqlite.bst

variables:
  arch-conf: ''
  (?):
  - target_arch == "x86_64" or target_arch == "aarch64":
      arch-conf: |
        USE_64=1

  make-args: |
    %{arch-conf} \
    OS_TARGET=Linux \
    OS_RELEASE=3.4 \
    "OS_TEST=%{arch}" \
    NSS_USE_SYSTEM_SQLITE=1 \
    NSS_ENABLE_WERROR=0 \
    NSS_DISABLE_GTESTS=1 \
    BUILD_OPT=1 \
    XCFLAGS="$CFLAGS" \
    DSO_CFLAGS="-fPIC $CFLAGS" \
    ZDEFS_FLAG="-Wl,-z,defs $LDFLAGS"

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{bindir}/*'
  cpe:
    product: network_security_services

config:
  build-commands:
  - |
    cd nss
    make -j1 %{make-args}

  install-commands:
  - |
    cd dist
    mkdir -p "%{install-root}/%{libdir}/"
    for lib in */lib/lib*.so*; do
      cp -L "${lib}" "%{install-root}/%{libdir}/"
    done
    mkdir -p "%{install-root}/%{bindir}/"
    cp -L */bin/* "%{install-root}/%{bindir}/"
    install -m 644 -D -t "%{install-root}/%{includedir}/nss" public/nss/*

  - |
    sed -f - nss.pc.in <<EOF >nss.pc
    s,@prefix@,%{prefix},g
    s,@exec_prefix@,%{exec_prefix},g
    s,@libdir@,%{libdir},g
    s,@includedir@,%{includedir}/nss,g
    s,@version@,3.41,g
    s,@nspr_version@,4.20,g
    EOF
    install -m 644 -D -t "%{install-root}/%{libdir}/pkgconfig" nss.pc

sources:
- kind: tar
  url: https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_41_RTM/src/nss-3.41.tar.gz
  ref: ab2e18f5d0dd0079c0005396f9beb9a41e9a1bbc7e6c1d0a99affcef0471712d
- kind: local
  path: files/nss.pc.in
