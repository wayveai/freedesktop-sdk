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
    --with-gssapi \
    --enable-debug

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libcurl.so'

  cpe:
    version: '7.64.0'

sources:
- kind: git_tag
  url: github:curl/curl.git
  track: master
  ref: curl-7_64_0-0-gf3294d9d86e6a7915a967efff2842089b8b0d071
