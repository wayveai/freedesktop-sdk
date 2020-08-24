kind: manual

depends:
- filename: bootstrap-import.bst
- filename: components/perl.bst

config:
  configure-commands:
  - |
    perl Makefile.PL PREFIX="%{prefix}" DESTDIR="%{install-root}"

  install-commands:
  - |
    make -j1 install

  - |
    find "%{install-root}" -type f -name perllocal.pod -delete

sources:
- kind: cpan
  name: 'Pod::Parser'
  url: cpan:authors/id/M/MA/MAREKR/Pod-Parser-1.63.tar.gz
  sha256sum: dbe0b56129975b2f83a02841e8e0ed47be80f060686c66ea37e529d97aa70ccd
