kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/tar.bst
- components/asciidoc.bst
- components/docbook-xsl.bst
- components/xmlto.bst
- components/libxslt.bst

depends:
- bootstrap-import.bst
- components/git-minimal.bst
- components/perl.bst
- components/python3.bst
- components/gnupg.bst
- components/curl.bst
- components/expat.bst
- components/libffi.bst
- components/openssl.bst

runtime-depends:
- components/ca-certificates.bst

environment:
  INSTALL_SYMLINKS: '1'

variables:
  # When build-dir is used with git, only configure logs land in
  # build-dir after running autogen
  build-dir: ''
  make: make all man
  make-install: make -j1 install install-man DESTDIR='%{install-root}'

config:
  install-commands:
    (>):
    - |
      find "%{install-root}" -type f -name perllocal.pod -delete

public:
  bst:
    overlap-whitelist:
    - "%{bindir}/git"
    - "%{debugdir}%{bindir}/git.debug"

(@):
- elements/include/git.yml
