kind: autotools
description: pcre

depends:
- filename: bootstrap/pcre-build-deps.bst
  type: build
- filename: bootstrap/glibc.bst
  type: runtime

(@): elements/bootstrap/include/target.yml

variables:
  conf-local: >-
    --enable-unicode-properties

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{bindir}/pcre-config'
        - '%{libdir}/libpcre.so'
        - '%{libdir}/libpcrecpp.so'
        - '%{libdir}/libpcreposix.so'

sources:
- kind: tar
  url: tar_https:ftp.pcre.org/pub/pcre/pcre-8.43.tar.bz2
  ref: 91e762520003013834ac1adb4a938d53b22a216341c061b0cf05603b290faf6b
