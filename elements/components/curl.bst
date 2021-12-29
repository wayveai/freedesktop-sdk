kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- bootstrap-import.bst
- components/gnutls.bst
- components/libnghttp2.bst

runtime-depends:
- components/ca-certificates.bst

# CURL OpenSSL and GnuTLS backends should be able to internally
# resolve certs.

variables:
  conf-local: >-
    --without-ca-bundle
    --with-ca-fallback
    --with-gnutls
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
  ref: curl-7_80_0-0-g9e560d11aad028de74addc0d1edfefa5667884f4
- kind: patch
  path: patches/curl/remove-doc-timestamp.patch
