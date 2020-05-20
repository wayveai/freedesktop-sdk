kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build

variables:
  conf-local: |
    --with-mantype=man

public:
  bst:
    split-rules:
      vm-only:
      - "%{bindir}/sshd"
      - "%{sysconfdir}/sshd_config"
      - "%{libexecdir}/sftp-server"
      - "%{mandir}/man5/sshd_config.5"
      - "%{mandir}/man8/sftp-server.8"
      - "%{mandir}/man8/sshd.8"
  cpe:
    vendor: 'openbsd'
    # We ignore the patch version because this is set in a different component in CPE
    version-match: '(\d+)_(\d+)'

sources:
- kind: git_tag
  url: github:openssh/openssh-portable.git
  track: master
  ref: V_8_2_P1-0-g8aa3455b16fddea4c0144a7c4a1edb10ec67dcc8
