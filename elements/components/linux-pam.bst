kind: manual

depends:
- bootstrap-import.bst

runtime-depends:
- components/linux-pam-base.bst
- components/pwquality.bst

variables:
  pamconfdir: "%{sysconfdir}/pam.d"

config:
  build-commands:
  - for tty in tty{1..6}; do echo "${tty}"; done >securetty

  install-commands:
  - install -Dm 644 -t "%{install-root}%{pamconfdir}" pam.d/*
  - install -Dm644 -t "%{install-root}%{sysconfdir}" securetty

sources:
- kind: local
  path: files/linux-pam-config
  directory: pam.d
