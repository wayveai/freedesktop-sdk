kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: base/buildsystem-autotools.bst
  type: build
- filename: base/openssl.bst

variables:
  conf-local: |
    --with-mantype=man

public:
  bst:
    split-rules:
      extra:
      - "%{bindir}/sshd"
      - "%{sysconfdir}/sshd_config"
      - "%{libexecdir}/sftp-server"
      - "%{mandir}/man5/sshd_config.5"
      - "%{mandir}/man8/sftp-server.8"
      - "%{mandir}/man8/sshd.8"

sources:
- kind: git_tag
  url: github:openssh/openssh-portable
  ref: V_7_9_P1-0-gaede1c34243a6f7feae2fb2cb686ade5f9be6f3d
