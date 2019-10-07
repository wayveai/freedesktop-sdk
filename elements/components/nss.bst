kind: manual

depends:
- filename: bootstrap-import.bst
- filename: components/perl.bst
  type: build
- filename: components/nspr.bst
- filename: components/sqlite.bst
- filename: components/p11-kit.bst
- filename: components/pkg-config.bst
  type: build

variables:
  arch-conf: ''
  (?):
  - target_arch in ["x86_64", "aarch64", "powerpc64le"]:
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
    version: '3.46.1'

config:
  build-commands:
  - |
    cd nss
    make -j1 %{make-args}

  - |
    gcc ${CFLAGS} ${LDFLAGS} -Wall load-p11-kit-trust.c -shared $(pkg-config --libs --cflags p11-kit-1) -o load-p11-kit-trust.so

  install-commands:
  - |
    cd dist
    for lib in */lib/lib*.so*; do
      case "${lib}" in
        */libnssckbi.so)
        ;;
        *)
          install -Dm644 -t "%{install-root}%{libdir}/" "${lib}"
        ;;
      esac
    done
    install -Dm755 -t "%{install-root}/%{bindir}/" */bin/*
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

  - |
    install -Dm644 -t "%{install-root}%{libdir}/" load-p11-kit-trust.so
    ln -s load-p11-kit-trust.so "%{install-root}%{libdir}/libnssckbi.so"

sources:
- kind: git_tag
  url: github:nss-dev/nss.git
  track: NSS_3_46_BRANCH
  track-extra:
  - master
  match:
  - 'NSS_*_RTM'
  ref: NSS_3_46_1_RTM-0-ga9f1b655f2c79076e018c365496eae8af5e3f922
  directory: nss
- kind: patch
  path: patches/nss/pkg-config-libdir.patch
- kind: local
  path: files/nss/load-p11-kit-trust.c
