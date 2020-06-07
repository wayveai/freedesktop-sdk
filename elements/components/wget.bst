kind: autotools
description: GNU wget

depends:
- bootstrap-import.bst
- components/gnutls.bst
- components/libidn2.bst
- components/libpsl.bst
- components/libunistring.bst
- components/nettle.bst
- components/pcre2.bst
- components/util-linux.bst

build-depends:
- components/gettext.bst
- components/flex.bst
- components/pkg-config.bst
- components/python3.bst

variables:
  conf-local: >-
    --disable-rpath

sources:
- kind: tar
  url: ftp_gnu_org:wget/wget-1.20.3.tar.lz
  ref: 69607ce8216c2d1126b7a872db594b3f21e511e660e07ca1f81be96650932abb
