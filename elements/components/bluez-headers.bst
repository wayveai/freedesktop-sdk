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
  ref: 5.51-0-g6de4bdb957cdc85d89851420ab06ca8e226f8d4e
