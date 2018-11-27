kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: base/buildsystem-autotools.bst
  type: build
- filename: base/gdbm.bst
- filename: base/groff.bst
  type: build
- filename: base/sqlite.bst
- filename: base/openssl.bst

variables:
  conf-local: |
    --with-plugindir="%{libdir}/sasl2" \
    --with-sqlite3 \
    --with-openssl \
    --disable-gssapi \
    --with-dblib=gdbm \
    --without-pam \
    --without-opie \
    --without-des

  builddir: ""

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
        - '%{libdir}/sasl2/lib*.so'
        - '%{libdir}/libsasl2.so'

sources:
- kind: git_tag
  url: github:cyrusimap/cyrus-sasl.git
  ref: cyrus-sasl-2.1.27-0-g09612adcda44fb1cfbbd704c46ab9112f01c2adb
