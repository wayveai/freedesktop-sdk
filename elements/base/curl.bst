kind: autotools

depends:
  - filename: bootstrap-import.bst
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
          - "%{libdir}/libcurl.so"

sources:
  - kind: tar
    url: https://github.com/curl/curl/releases/download/curl-7_61_0/curl-7.61.0.tar.xz
    ref: ef6e55192d04713673b4409ccbcb4cb6cd723137d6e10ca45b0c593a454e1720
