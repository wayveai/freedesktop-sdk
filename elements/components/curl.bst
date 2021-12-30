kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- bootstrap-import.bst
- components/gnutls.bst
- components/libnghttp2.bst

runtime-depends:
- components/ca-certificates.bst

# --with-ca-fallback only works with OpenSSL and GnuTLS backends
# so only those can be selected. We pick GnuTLS due to licensing
# reasons

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
  ref: curl-7_79_1-0-gc7aef0a945f9b6fb6d3f91716a21dfe2f4ea635f
- kind: patch
  path: patches/curl/remove-doc-timestamp.patch
