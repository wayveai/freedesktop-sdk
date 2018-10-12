kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: base/buildsystem-autotools.bst
  type: build
- filename: base/openssl.bst

variables:
  conf-local: |
    --with-mantype=man

config:
  install-commands:
    (>):
    - rm -f %{install-root}%{bindir}/sshd
    - rm -f %{install-root}%{sysconfdir}/sshd_config
    - rm -f %{install-root}%{libexecdir}/sftp-server
    - rm -f %{install-root}%{mandir}/man5/sshd_config.5
    - rm -f %{install-root}%{mandir}/man8/sftp-server.8
    - rm -f %{install-root}%{mandir}/man8/sshd.8

sources:
- kind: git_tag
  url: https://github.com/openssh/openssh-portable
  ref: aede1c34243a6f7feae2fb2cb686ade5f9be6f3d   #  V_7_9_P1
