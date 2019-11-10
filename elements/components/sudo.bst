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
  url: https://www.sudo.ws/dist/sudo-1.8.27.tar.gz
  ref: 7beb68b94471ef56d8a1036dbcdc09a7b58a949a68ffce48b83f837dd33e2ec0
