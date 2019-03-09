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
    NSPR_VERSION="$(/usr/bin/nspr-config --version)"
    NSS_VERSION="$(grep NSS_VERSION dist/public/nss/nss.h | sed -e 's/[^"]*"//' -e 's/".*//' -e 's/ .*//')"
    MOD_MAJOR_VERSION="$(echo "${NSS_VERSION}" | cut -d. -f1)"
    MOD_MINOR_VERSION="$(echo "${NSS_VERSION}" | cut -d. -f2)"
    MOD_PATCH_VERSION="$(echo "${NSS_VERSION}" | cut -d. -f3)"

    for f in nss/pkg/pkg-config/*.in; do
      sed -f - "${f}" <<EOF >"$(basename "${f}" .in)"
    s,%,@,g
    s,@prefix@,%{prefix},g
    s,@exec_prefix@,%{exec_prefix},g
    s,@libdir@,%{libdir},g
    s,@includedir@,%{includedir}/nss,g
    s,@NSS_VERSION@,${NSS_VERSION},g
    s,@NSPR_VERSION@,${NSPR_VERSION},g
    s,@MOD_MAJOR_VERSION@,${MOD_MAJOR_VERSION},g
    s,@MOD_MINOR_VERSION@,${MOD_MINOR_VERSION},g
    s,@MOD_PATCH_VERSION@,${MOD_PATCH_VERSION},g
    EOF
    done
    install -m 644 -D -t "%{install-root}/%{libdir}/pkgconfig" nss.pc
    install -m 755 -D -t "%{install-root}/%{bindir}" nss-config

sources:
- kind: tar
  url: https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_42_1_RTM/src/nss-3.42.1.tar.gz
  ref: 087db37d38fd49dfd584dd2a8b5baa7fc88de7c9bd97c0c2d5be4abcafc61fc6
- kind: patch
  path: patches/nss/pkg-config-libdir.patch
