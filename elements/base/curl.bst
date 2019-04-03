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
    --enable-debug \
    --enable-optimize \
    --disable-warnings \
    --disable-curldebug

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libcurl.so'

  cpe:
    version: '7.64.1'

sources:
- kind: git_tag
  url: github:curl/curl.git
  track: master
  ref: curl-7_64_1-0-g521bbbe29928f9bc1c61306df612e856d45cbe5a
