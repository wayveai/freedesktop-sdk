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
  cpe:
    vendor: 'openbsd'
    version: '8.0'

sources:
- kind: git_tag
  url: github:openssh/openssh-portable.git
  track: master
  ref: V_8_0_P1-0-gfd0fa130ecf06d7d092932adcd5d77f1549bfc8d
