kind: manual

depends:
  - filename: bootstrap-import.bst
    type: build
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
    NSS_ENABLE_ECC=1

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
      s,@version@,3.34.1,g
      s,@nspr_version@,4.17,g
      EOF
      install -m 644 -D -t "%{install-root}/%{libdir}/pkgconfig" nss.pc

sources:
  - kind: tar
    url: https://archive.mozilla.org/pub/security/nss/releases/NSS_3_34_1_RTM/src/nss-3.34.1.tar.gz
    ref: a3c15d367caf784f33d96dbafbdffc16a8e42fb8c8aedfce97bf92a9f918dda0
  - kind: local
    path: files/nss.pc.in
