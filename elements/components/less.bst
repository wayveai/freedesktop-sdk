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
  url: ftp_gnu_org:less/less-581.2.tar.gz
  ref: ce34b47caf20a99740672bf560fc48d5d663c5e78e67bc254e616b9537d5d83b
