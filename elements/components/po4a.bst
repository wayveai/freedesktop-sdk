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
  ref: v0.64-0-g7fe12ca2a127313b4bbe989e871ddacb7dd26ca4
