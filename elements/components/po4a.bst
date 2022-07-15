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
  ref: v0.67-0-g20b08eaae7a1fb5560375515e6eeb50508afc2cb
