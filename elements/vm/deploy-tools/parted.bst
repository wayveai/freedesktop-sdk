kind: autotools

depends:
- bootstrap-import.bst
- base/util-linux.bst
- vm/deploy-tools/lvm2.bst

sources:
- kind: tar
  url: https://ftp.gnu.org/gnu/parted/parted-3.2.tar.xz
  ref: 858b589c22297cacdf437f3baff6f04b333087521ab274f7ab677cb8c6bb78e4
