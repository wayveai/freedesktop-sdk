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
        - '%{bindir}/envsubst'
        - '%{bindir}/gettextize'
        - '%{bindir}/gettext.sh'
        - '%{bindir}/msgattrib'
        - '%{bindir}/msgcat'
        - '%{bindir}/msgcmp'
        - '%{bindir}/msgcomm'
        - '%{bindir}/msgconv'
        - '%{bindir}/msgen'
        - '%{bindir}/msgexec'
        - '%{bindir}/msgfilter'
        - '%{bindir}/msgfmt'
        - '%{bindir}/msggrep'
        - '%{bindir}/msginit'
        - '%{bindir}/msgmerge'
        - '%{bindir}/msgunfmt'
        - '%{bindir}/msguniq'
        - '%{bindir}/ngettext'
        - '%{bindir}/recode-sr-latin'
        - '%{bindir}/xgettext'
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
  url: ftp_gnu_org:gettext/gettext-0.20.2.tar.lz
  ref: 6d84e873329f5fd4198843cecd1017159b2601e5b8f1dcf11324a78322e74ed5
