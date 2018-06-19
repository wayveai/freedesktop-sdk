kind: autotools

depends:
  - filename: bootstrap-import.bst
  - filename: base/perl.bst
    type: build
  - filename: base/bison.bst
    type: build

public:
  bst:
    split-rules:
      devel:
        (>):
          - "%{libdir}/libcom_err.so"
          - "%{libdir}/libgssapi_krb5.so"
          - "%{libdir}/libgssrpc.so"
          - "%{libdir}/libk5crypto.so"
          - "%{libdir}/libkadm5clnt_mit.so"
          - "%{libdir}/libkadm5clnt.so"
          - "%{libdir}/libkadm5srv_mit.so"
          - "%{libdir}/libkadm5srv.so"
          - "%{libdir}/libkdb5.so"
          - "%{libdir}/libkrad.so"
          - "%{libdir}/libkrb5.so"
          - "%{libdir}/libkrb5support.so"
          - "%{libdir}/libverto.so"

config:
  configure-commands:
    - |
      mkdir "%{builddir}"
      cd "%{builddir}"
      ../src/%{configure}

sources:
  - kind: tar
    url: https://web.mit.edu/Kerberos/dist/krb5/1.16/krb5-1.16.tar.gz
    ref: faeb125f83b0fb4cdb2f99f088140631bb47d975982de0956d18c85842969e08
