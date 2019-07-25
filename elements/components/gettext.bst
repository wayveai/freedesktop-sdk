kind: autotools
description: GNU gettext

depends:
- filename: bootstrap-import.bst
- filename: components/gzip.bst
- filename: components/tar.bst
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
        - '%{libdir}/libtextstyle.so'

sources:
- kind: tar
  url: ftp_gnu_org:gettext/gettext-0.20.1.tar.xz
  ref: 53f02fbbec9e798b0faaf7c73272f83608e835c6288dd58be6c9bb54624a3800
