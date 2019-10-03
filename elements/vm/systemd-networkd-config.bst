kind: manual

depends:
- filename: components/systemd.bst

variables:
  networkd-config: "%{install-root}%{indep-libdir}/systemd/network/"

config:
  install-commands:
  - |
    mkdir -p "%{networkd-config}"
    install -m 644 -t "%{networkd-config}" 20-wired.network

public:
  bst:
    integration-commands:
    - /usr/bin/systemctl enable systemd-networkd

sources:
- kind: local
  path: files/systemd-networkd/20-wired.network
