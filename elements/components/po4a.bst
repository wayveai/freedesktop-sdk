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
  ref: v0.63-0-g5d2498c644c42724a6a70fc9351e76f3f6e1fc16
