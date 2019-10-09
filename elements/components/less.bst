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
  url: ftp_gnu_org:less/less-530.tar.gz
  ref: 503f91ab0af4846f34f0444ab71c4b286123f0044a4964f1ae781486c617f2e2
