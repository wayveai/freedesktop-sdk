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
        - '%{datadir}/gettext*'
        - '%{datadir}/gettext*/*'

sources:
- kind: tar
  url: ftp_gnu_org:gettext/gettext-0.20.1.tar.xz
  ref: 53f02fbbec9e798b0faaf7c73272f83608e835c6288dd58be6c9bb54624a3800
- kind: patch
  path: patches/gettext/gettext.git-2336451ed68d91ff4b5ae1acbc1eca30e47a86a9.patch
