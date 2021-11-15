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
  ref: v0.65-0-g4216806d550ee308fdc0a111d9ddabc1b3fcf235
