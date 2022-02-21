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
  ref: master-2022-02-18-0-g4dac44b3705239cd874205efc47fecef1fa25276
