kind: manual

depends:
- bootstrap-import.bst

config:
  install-commands:
  - install -Dm644 -t "%{install-root}%{indep-libdir}/firmware" regulatory.{db,db.p7s,bin}

sources:
- kind: git_tag
  url: kernel:linux/kernel/git/sforshee/wireless-regdb.git
  track: master
  ref: master-2019-06-03-0-g49b8d9c09b145c2124184921640fa44f96630afc
