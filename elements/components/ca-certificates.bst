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
    (cd "%{install-root}%{datadir}/ca-certificates"; find -name "*.crt" | cut -c 3- ) >"%{install-root}%{sysconfdir}/ca-certificates.conf"

public:
  bst:
    integration-commands:
    - |
      update-ca-certificates

sources:
- kind: git_tag
  url: debian_salsa:debian/ca-certificates.git
  track: master
  exclude:
  # https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=962596
  - archive/debian/20200601
  - debian/20200601
  ref: debian/20190110-0-gc28799b138b044c963d24c4a69659b6e5486e3be
- kind: patch
  path: patches/ca-certificates/ca-certificates-Make-it-possible-to-overwrite-python-version.patch
