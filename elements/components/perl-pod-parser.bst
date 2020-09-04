kind: makemaker

depends:
- bootstrap-import.bst
- components/perl.bst

sources:
- kind: cpan
  name: 'Pod::Parser'
  url: cpan:authors/id/M/MA/MAREKR/Pod-Parser-1.63.tar.gz
  sha256sum: dbe0b56129975b2f83a02841e8e0ed47be80f060686c66ea37e529d97aa70ccd
