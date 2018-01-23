kind: autotools

depends:
  - filename: bootstrap-import.bst
    type: build
  - filename: base/perl.bst
    type: build
  - filename: base/bison.bst
    type: build

public:
  bst:
    split-rules:
      devel:
        (>):
          - "libcom_err.so"
          - "libgssapi_krb5.so"
          - "libgssrpc.so"
          - "libk5crypto.so"
          - "libkadm5clnt_mit.so"
          - "libkadm5clnt.so"
          - "libkadm5srv_mit.so"
          - "libkadm5srv.so"
          - "libkdb5.so"
          - "libkrad.so"
          - "libkrb5.so"
          - "libkrb5support.so"
          - "libverto.so"

config:
  configure-commands:
    - |
      mkdir "%{builddir}"
      cd "%{builddir}"
      ../src/%{configure}

sources:
  - kind: tar
    url: http://web.mit.edu/Kerberos/dist/krb5/1.16/krb5-1.16.tar.gz
    ref: faeb125f83b0fb4cdb2f99f088140631bb47d975982de0956d18c85842969e08
