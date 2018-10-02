kind: autotools

depends:
  - filename: bootstrap-import.bst
  - filename: base/buildsystem-autotools.bst
    type: build
  - filename: base/openssl-1.0.bst
    type: build
  - filename: base/openssl-1.0-runtime-only.bst
    type: runtime

variables:
  conf-local: |
    --with-mantype=man

config:
  install-commands:
    (>):
      - rm -f %{install-root}%{bindir}/sshd
      - rm -f %{install-root}%{sysconfdir}/sshd_config
      - rm -f %{install-root}%{libexecdir}/sftp-server
      - rm -f %{install-root}%{mandir}/man5/sshd_config
      - rm -f %{install-root}%{mandir}/man8/sftp-server.8
      - rm -f %{install-root}%{mandir}/man8/sshd.8

sources:
  - kind: git
    url: https://github.com/openssh/openssh-portable
    ref: 71508e06fab14bc415a79a08f5535ad7bffa93d9  # V_7_8_P1
