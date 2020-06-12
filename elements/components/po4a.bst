kind: manual

build-depends:
- filename: components/perl-build.bst
- filename: components/gettext.bst
- filename: components/libxslt.bst
- filename: components/docbook-xsl.bst

depends:
- filename: bootstrap-import.bst
- filename: components/perl.bst

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
