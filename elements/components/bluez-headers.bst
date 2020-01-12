kind: manual

build-depends:
- bootstrap-import.bst

config:
  install-commands:
  - |
    install -D -m644 -t "%{install-root}%{includedir}/bluetooth" lib/*.h

sources:
- kind: git_tag
  url: kernel:bluetooth/bluez.git
  track: master
  ref: 5.52-0-ge002fd43636090ac246f80f5de6195055384dfed
