kind: autotools

depends:
- filename: bootstrap-import.bst

public:
  initial-script:
    script: |
      #!/bin/bash
      sysroot="${1}"
      chmod 0600 "${sysroot}%{sysconfdir}/sudoers"
      chmod 0600 "${sysroot}%{sysconfdir}/sudoers.d"/*
      chmod 4755 "${sysroot}%{bindir}/sudo"

sources:
- kind: tar
  url: tar_https:www.sudo.ws/dist/sudo-1.9.7p1.tar.gz
  ref: 391431f454e55121b60c6ded0fcf30ddb80d623d7d16a6d1907cfa6a0b91d8cf
