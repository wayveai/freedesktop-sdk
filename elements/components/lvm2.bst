kind: autotools

depends:
- bootstrap-import.bst
- components/libaio.bst

sources:
- kind: git_tag
  url: sourceware:lvm2.git
  track: master
  ref: v2_02_183-0-gf5ea02ffee3269a77e295d2b186ca81481f592d7
