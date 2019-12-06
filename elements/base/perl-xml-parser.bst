kind: manual

depends:
- filename: bootstrap-import.bst
- filename: base/perl.bst
- filename: base/expat.bst

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
- kind: tar
  url: tar_https:cpan.metacpan.org/authors/id/T/TO/TODDR/XML-Parser-2.44.tar.gz
  ref: 1ae9d07ee9c35326b3d9aad56eae71a6730a73a116b9fe9e8a4758b7cc033216

