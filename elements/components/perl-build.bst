kind: manual

depends:
- filename: bootstrap-import.bst
- filename: components/perl.bst

config:
  configure-commands:
  - perl Makefile.PL PREFIX="%{prefix}" DESTDIR="%{install-root}"

  install-commands:
  - |
    make -j1 install

sources:
- kind: git_tag
  url: github:Perl-Toolchain-Gang/Module-Build
  track: master
  ref: 0.4231-0-g3d8f0f1b71357ada575c7437a988d1b78c60c917
