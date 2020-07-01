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
  url: tar_https:www.sudo.ws/dist/sudo-1.9.1.tar.gz
  ref: 294116cefe10a02773917fc7440d8384b925955bc96a6e0eaa1977c83b34adff
