kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- bootstrap-import.bst
- components/gnutls.bst
- components/nss.bst
- components/libnghttp2.bst
- components/openssl.bst

# Curl must be configured --with-ca-bundle in order to find the
# correct certificate bundle at runtime, which is later generated
# by update-ca-certificates. Other applications such as git, rely
# on curl knowing the default location of the certs.

variables:
  conf-local: >-
    --with-ca-bundle=%{ca_path}
    --with-gnutls
    --with-ssl
    --with-nss
    --with-gssapi
    --with-nghttp2
    --enable-debug
    --enable-optimize
    --disable-warnings
    --disable-curldebug

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{bindir}/curl-config'
        - '%{libdir}/libcurl.so'

  cpe:
    version-match: '(\d+)_(\d+)_(\d+)'

sources:
- kind: git_tag
  url: github:curl/curl.git
  track: master
  ref: curl-7_79_1-0-gc7aef0a945f9b6fb6d3f91716a21dfe2f4ea635f
- kind: patch
  path: patches/curl/remove-doc-timestamp.patch
