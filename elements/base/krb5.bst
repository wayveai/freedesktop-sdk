kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: base/perl.bst
  type: build
- filename: base/bison.bst
  type: build
- filename: base/buildsystem-autotools.bst
  type: build
- filename: base/e2fsprogs.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libgssapi_krb5.so'
        - '%{libdir}/libgssrpc.so'
        - '%{libdir}/libk5crypto.so'
        - '%{libdir}/libkadm5clnt_mit.so'
        - '%{libdir}/libkadm5clnt.so'
        - '%{libdir}/libkadm5srv_mit.so'
        - '%{libdir}/libkadm5srv.so'
        - '%{libdir}/libkdb5.so'
        - '%{libdir}/libkrad.so'
        - '%{libdir}/libkrb5.so'
        - '%{libdir}/libkrb5support.so'
        - '%{libdir}/libverto.so'

config:
  configure-commands:
  - |
    mkdir "%{builddir}"
    cd "%{builddir}"
    ../src/%{configure} --with-system-et --with-system-ss

sources:
- kind: tar
  url: https://kerberos.org/dist/krb5/1.16/krb5-1.16.2.tar.gz
  ref: 9f721e1fe593c219174740c71de514c7228a97d23eb7be7597b2ae14e487f027
