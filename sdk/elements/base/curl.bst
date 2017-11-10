kind: myautotools

depends:
  - filename: bootstrap-import.bst
    type: build
  - filename: base/pkg-config.bst
    type: build
  - filename: base/gnutls.bst
  - filename: base/openssl.bst

variables:
  conf-extra: |
    --with-gnutls \
    --with-ssl

public:
  bst:
    split-rules:
      devel:
        - "%{libdir}/libcurl.so"

sources:
  - kind: tar
    url: https://github.com/curl/curl/releases/download/curl-7_56_1/curl-7.56.1.tar.xz
    ref: 8eed282cf3a0158d567a0feaa3c4619e8e847970597b5a2c81879e8f0d1a39d1
