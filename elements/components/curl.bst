kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: components/gnutls.bst
- filename: components/nss.bst

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
    version: '7.65.2'

sources:
- kind: git_tag
  url: github:curl/curl.git
  track: master
  ref: curl-7_65_2-0-g72c2cac8f0ac3a89c21d00b6c6e36fe6c6a8e62b
