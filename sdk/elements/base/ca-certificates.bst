kind: manual

depends:
  - filename: bootstrap-import.bst
    type: build
  - filename: base/python2.bst
    type: build

config:
  build-commands:
    - |
      make

  install-commands:
    - |
      install -d -m 0755 "%{install-root}/usr/share/ca-certificates/mozilla"
      install -d -m 0755 "%{install-root}/usr/sbin"
      install -d -m 0755 "%{install-root}/usr/bin"
      install -d -m 0755 "%{install-root}/usr/etc/ssl/certs"

    - |
      make install DESTDIR="%{install-root}"

    - |
      mv "%{install-root}/usr/sbin/update-ca-certificates" "%{install-root}/usr/bin/update-ca-certificates"
      rm -rf "%{install-root}/usr/sbin"

    - |
      (cd "%{install-root}/usr/share/ca-certificates"; find -name "*.crt") >"%{install-root}/usr/etc/ca-certificates.conf"

public:
  bst:
    integration-commands:
      - |
        update-ca-certificates

sources:
  - kind: git
    url: git://anonscm.debian.org/collab-maint/ca-certificates.git
    track: master
    ref: 238e0aa38b26bcbd6d0b0130868bec9efa6566be
