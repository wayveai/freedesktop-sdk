kind: autotools
description: GNU wget

depends:
- bootstrap-import.bst
- components/gnutls.bst
- components/libidn2.bst
- components/libpsl.bst
- components/libunistring.bst
- components/nettle.bst
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
  url: ftp_gnu_org:wget/wget-1.21.tar.lz
  ref: 87ae105e76e5b550e03e009ba94341143c66623a5ecbba047f6ef850608b6596
