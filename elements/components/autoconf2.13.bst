kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: components/m4.bst

variables:
  builddir: ''

config:
  install-commands:
  - |
    make -j1 install prefix="%{install-root}%{prefix}" \
                     bindir="%{install-root}%{bindir}" \
                     datadir="%{install-root}%{datadir}" \
                     infodir="%{install-root}%{infodir}"

  - |
    mv %{install-root}%{bindir}/autoconf %{install-root}%{bindir}/autoconf-2.13


sources:
- kind: tar
  url: ftp_gnu_org:autoconf/autoconf-2.13.tar.gz
  ref: f0611136bee505811e9ca11ca7ac188ef5323a8e2ef19cffd3edb3cf08fd791e
