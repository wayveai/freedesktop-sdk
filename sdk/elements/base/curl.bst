kind: autotools

depends:
  - filename: base/pkg-config.bst
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
    --with-ca-bundle=/etc/ssl/certs/ca-certificates.crt \
    --with-gnutls \
    --with-ssl \
    --with-nss \
    --with-gssapi

public:
  bst:
    split-rules:
      devel:
        (>):
          - "%{libdir}/libcurl.so"

sources:
  - kind: tar
    url: https://github.com/curl/curl/releases/download/curl-7_56_1/curl-7.56.1.tar.xz
    ref: 8eed282cf3a0158d567a0feaa3c4619e8e847970597b5a2c81879e8f0d1a39d1
