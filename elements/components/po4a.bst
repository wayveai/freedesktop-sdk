kind: modulebuild

build-depends:
- components/perl-build.bst
- components/gettext.bst
- components/libxslt.bst
- components/docbook-xsl.bst
- components/perl-pod-parser.bst

depends:
- bootstrap-import.bst
- components/perl.bst

sources:
- kind: git_tag
  url: github:mquinson/po4a.git
  track: master
  ref: v0.62-0-ga2c9de0ac3f1a64fb0c2d9029e040c5291c2b653
