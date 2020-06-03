kind: manual

build-depends:
- bootstrap-import.bst

runtime-depends:
- components/shadow.bst

config:
  install-commands:
  - install -Dm644 -t "%{install-root}/etc/default" useradd

sources:
- kind: local
  path: files/vm/useradd-config-ostree/useradd
