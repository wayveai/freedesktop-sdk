kind: manual

depends:
- filename: components/systemd.bst

variables:
  resolved-config: "%{install-root}/etc/systemd/"

config:
  install-commands:
  - |
    mkdir -p "%{resolved-config}"
    install -m 644 -t "%{resolved-config}" resolved.conf

public:
  bst:
    integration-commands:
    - /usr/bin/systemctl enable systemd-resolved
    overlap-whitelist:
    - etc/systemd/resolved.conf

sources:
- kind: local
  path: files/systemd-resolved/resolved.conf
