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
  ref: master-2022-06-06-0-g68a8f2f89cc58989bf4c1ade4757b2d5b680127e
