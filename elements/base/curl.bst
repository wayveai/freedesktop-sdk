kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: base/buildsystem-autotools.bst
  type: build
- filename: base/gnutls.bst
- filename: base/openssl.bst
- filename: base/krb5.bst
- filename: base/nss.bst

# Curl must be configured --with-ca-bundle in order to find the
# correct certificate bundle at runtime, which is later generated
# by update-ca-certificates. Other applications such as git, rely
# on curl knowing the default location of the certs.

variables:
  conf-local: |
    --with-ca-bundle=%{ca_path} \
    --with-gnutls \
    --with-ssl \
    --with-nss \
    --with-gssapi

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libcurl.so'

sources:
- kind: tar
  url: github:curl/curl/releases/download/curl-7_63_0/curl-7.63.0.tar.xz
  ref: 9600234c794bfb8a0d3f138e9294d60a20e7a5f10e35ece8cf518e2112d968c4
