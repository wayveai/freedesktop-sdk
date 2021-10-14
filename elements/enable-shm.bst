kind: manual

build-depends:
- bootstrap-import.bst

config:
  install-commands:
  - mkdir -p "%{install-root}/dev"
  - ln -sr "%{install-root}/tmp" "%{install-root}/dev/shm"
