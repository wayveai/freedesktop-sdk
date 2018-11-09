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
  url: github:curl/curl/releases/download/curl-7_61_1/curl-7.61.1.tar.xz
  ref: 3d5913d6a39bd22e68e34dff697fd6e4c3c81563f580c76fca2009315cd81891
