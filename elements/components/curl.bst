kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- bootstrap-import.bst
- components/libnghttp2.bst
- components/openssl.bst

runtime-depends:
- components/ca-certificates.bst

# --with-ca-fallback only works with OpenSSL and GnuTLS backends
# so only those can be selected. We pick GnuTLS due to licensing
# reasons

variables:
  conf-local: >-
    --without-ca-bundle
    --with-ca-fallback
    --with-ssl
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
  ref: curl-7_82_0-0-g64db5c575d9c5536bd273a890f50777ad1ca7c13
- kind: patch
  path: patches/curl/remove-doc-timestamp.patch
