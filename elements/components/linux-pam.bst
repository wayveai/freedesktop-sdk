kind: manual

depends:
- bootstrap-import.bst

runtime-depends:
- components/linux-pam-base.bst
- components/pwquality.bst

variables:
  pamconfdir: "%{sysconfdir}/pam.d"

config:
  install-commands:
  - install -Dm 644 -t "%{install-root}%{pamconfdir}" *

sources:
- kind: local
  path: files/linux-pam-config
