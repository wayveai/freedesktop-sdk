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
  ref: master-2022-04-08-1-0-g166fbddc84ba13f17b133073331e015e0f52f0da
