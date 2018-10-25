kind: manual

depends:
- filename: bootstrap-import.bst
- filename: base/python3.bst
  type: build

config:
  build-commands:
  - |
    python3 generate.py

  install-commands:
  - |
    install -D -m644 -t "%{install-root}%{sysconfdir}" protocols services

sources:
- kind: git
  url: https://gitlab.com/freedesktop-sdk/mirrors/iana-config.git
  track: master
  ref: bc91cf638e0980c7f2e09285217f5868923ec518

- kind: local
  path: files/iana-config
