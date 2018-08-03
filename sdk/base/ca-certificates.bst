kind: manual

depends:
  - filename: bootstrap-import.bst
  - filename: base/openssl.bst
  - filename: base/python3.bst
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
    url: https://salsa.debian.org/debian/ca-certificates.git
    track: debian/20161130+nmu1+deb9u1
    ref: 024d12e7f29fed75e527df90175a3a73a3e1a7b4
  - kind: patch
    path: patches/ca-certificates-Make-it-possible-to-overwrite-python-version.patch
