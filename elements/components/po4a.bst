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
  ref: v0.59.1-0-ge3875d4caf22f26cecaac3d1b9946c7ca1c0263b
