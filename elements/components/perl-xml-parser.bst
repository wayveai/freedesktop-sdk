kind: manual

depends:
- filename: bootstrap-import.bst
- filename: components/perl.bst
- filename: components/expat.bst

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
  name: XML::Parser
  url: cpan:authors/id/T/TO/TODDR/XML-Parser-2.46.tar.gz
  sha256sum: d331332491c51cccfb4cb94ffc44f9cd73378e618498d4a37df9e043661c515d
