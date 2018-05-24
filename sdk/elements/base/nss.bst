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
    NSS_ENABLE_ECC=1 \
    NSS_ENABLE_WERROR=0

public:
  bst:
    split-rules:
      devel:
        (>):
          - "%{bindir}/*"

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
      s,@version@,3.37,g
      s,@nspr_version@,4.19,g
      EOF
      install -m 644 -D -t "%{install-root}/%{libdir}/pkgconfig" nss.pc

sources:
  - kind: tar
    url: https://archive.mozilla.org/pub/security/nss/releases/NSS_3_36_1_RTM/src/nss-3.36.1.tar.gz
    ref: 6025441d528ff6a7f1a4b673b6ee7d3540731ada3f78d5acd5c3b3736b222bff
  - kind: local
    path: files/nss.pc.in
