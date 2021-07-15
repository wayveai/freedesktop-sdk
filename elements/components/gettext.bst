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
        - '%{bindir}/autopoint'
        - '%{bindir}/gettextize'
        - '%{libdir}/gettext/*'
        - '%{libdir}/libgettextsrc.so'
        - '%{libdir}/libgettextlib.so'
        - '%{libdir}/libgettextpo.so'
        - '%{libdir}/libasprintf.so'
        - '%{libdir}/libtextstyle.so'
        - '%{libdir}/preloadable_libintl.so'
        - '%{datadir}/gettext/projects'
        - '%{datadir}/gettext/projects/**'
        - '%{datadir}/gettext/archive.dir.tar.bz2'
        - '%{datadir}/gettext/config.rpath'
        - '%{datadir}/gettext/gettext.h'
        - '%{datadir}/gettext/javaversion.class'
        - '%{datadir}/gettext/msgunfmt.tcl'

sources:
- kind: tar
  url: ftp_gnu_org:gettext/gettext-0.21.tar.lz
  ref: 435b546e3880ab767c967c0731b20629a0cb0ba620e6bac2f590f401c10ebb45
