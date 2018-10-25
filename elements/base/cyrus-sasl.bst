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

config:
  build-commands:
  - |
    cd "%{builddir}"
    %{make} sasldir="%{libdir}/sasl2"

  install-commands:
  - |
    cd "%{builddir}"
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
- kind: git
  url: https://github.com/cyrusimap/cyrus-sasl.git
  ref: 3f420d388d88e720ceb9f8bc53a590395c761f03   # 2.1.27-rc7
