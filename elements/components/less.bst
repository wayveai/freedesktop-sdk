kind: autotools
description: GNU less

depends:
- filename: bootstrap-import.bst

public:
  cpe:
    vendor: 'gnu'
    version-match: '\d+'

sources:
- kind: tar
  url: ftp_gnu_org:less/less-590.tar.gz
  ref: 6aadf54be8bf57d0e2999a3c5d67b1de63808bb90deb8f77b028eafae3a08e10
