kind: autotools

depends:
- bootstrap-import.bst
- vm/bsp-generic/libaio.bst

sources:
- kind: git_tag
  url: sourceware:lvm2.git
  track: master
  ref: v2_02_177-0-ga1f7a483253b11e52ad5460b28cf0c75dba26659
