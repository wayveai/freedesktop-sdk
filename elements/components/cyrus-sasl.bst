kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/groff.bst

depends:
- bootstrap-import.bst
- components/gdbm.bst
- components/sqlite.bst
- components/openssl.bst

variables:
  # Uses generated header md5global.h into source directory
  build-dir: ''
  conf-local: >-
    --with-plugindir="%{libdir}/sasl2"
    --with-sqlite3
    --with-openssl
    --disable-gssapi
    --with-dblib=gdbm
    --without-pam
    --without-opie
    --without-des

config:
  build-commands:
  - |
    %{make} sasldir="%{libdir}/sasl2"

  install-commands:
  - |
    %{make-install} sasldir="%{libdir}/sasl2"

  - |
    %{delete_libtool_files}

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/sasl2/lib*.la'
        - '%{libdir}/libsasl2.so'
  cpe:
    patches:
    - CVE-2019-19906

sources:
- kind: git_tag
  url: github:cyrusimap/cyrus-sasl.git
  track: master
  ref: cyrus-sasl-2.1.27-0-g0189425cc210555c36383293c468df5da73acc48
- kind: patch
  path: patches/cyrus-sasl/CVE-2019-19906.patch
