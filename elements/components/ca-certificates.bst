kind: manual

depends:
- filename: bootstrap-import.bst
- filename: components/python3.bst
  type: build

config:
  build-commands:
  - |
    PYTHON=python3 make

  install-commands:
  - |
    install -d -m 0755 "%{install-root}/usr/share/ca-certificates/mozilla"
    install -d -m 0755 "%{install-root}/usr/sbin"
    install -d -m 0755 "%{install-root}/usr/bin"
    install -d -m 0755 "%{install-root}/etc/ssl/certs"

  - |
    make install DESTDIR="%{install-root}"

  - |
    mv "%{install-root}/usr/sbin/update-ca-certificates" "%{install-root}/usr/bin/update-ca-certificates"
    rm -rf "%{install-root}/usr/sbin"

  - |
    (cd "%{install-root}%{datadir}/ca-certificates"; find -name "*.crt") >"%{install-root}%{sysconfdir}/ca-certificates.conf"

public:
  bst:
    integration-commands:
    - |
      update-ca-certificates

sources:
- kind: git_tag
  url: debian_salsa:debian/ca-certificates.git
  track: master
  ref: archive/debian/20200601-0-gb3a8980b781bc9a370e42714a605cd4191bb6c0b
- kind: patch
  path: patches/ca-certificates/ca-certificates-Make-it-possible-to-overwrite-python-version.patch
