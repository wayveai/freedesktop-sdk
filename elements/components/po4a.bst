kind: manual

build-depends:
- components/perl-build.bst
- components/gettext.bst
- components/libxslt.bst
- components/docbook-xsl.bst
- components/perl-pod-parser.bst

depends:
- bootstrap-import.bst
- components/perl.bst

config:
  configure-commands:
  - perl Build.PL --prefix "%{prefix}" --destdir "%{install-root}"

  build-commands:
  - ./Build

  install-commands:
  - ./Build install

sources:
- kind: git_tag
  url: github:mquinson/po4a.git
  track: master
  ref: v0.60-0-gcf9e53d763458da404c6f2fca4e1f9f7d5e41aca
