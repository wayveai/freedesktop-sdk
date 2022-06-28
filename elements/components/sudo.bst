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
  url: tar_https:www.sudo.ws/dist/sudo-1.9.11p3.tar.gz
  ref: 4687e7d2f56721708f59cca2e1352c056cb23de526c22725615a42bb094f1f70
