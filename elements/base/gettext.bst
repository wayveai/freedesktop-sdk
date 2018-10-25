kind: autotools
description: GNU gettext

depends:
- filename: bootstrap-import.bst
- filename: base/gzip.bst
- filename: base/tar.bst
  type: runtime

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libgettextsrc.so'
        - '%{libdir}/libgettextlib.so'
        - '%{libdir}/libgettextpo.so'
        - '%{libdir}/libasprintf.so'

sources:
- kind: tar
  url: ftp_gnu_org:gettext/gettext-0.19.8.1.tar.xz
  ref: 105556dbc5c3fbbc2aa0edb46d22d055748b6f5c7cd7a8d99f8e7eb84e938be4
- kind: patch
  path: patches/gettext-reproducible.patch
