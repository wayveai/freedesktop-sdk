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
  ref: master-2021-08-28-0-g47007d0169c4c6c855a3fc5333c142489a43e89e
