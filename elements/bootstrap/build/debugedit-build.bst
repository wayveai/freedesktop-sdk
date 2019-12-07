kind: autotools

depends:
- filename: bootstrap/build/base-sdk.bst
  type: build
- filename: bootstrap/gnu-config.bst
  type: build
- filename: bootstrap/build/file-stage1.bst
- filename: bootstrap/build/elfutils-build.bst

(@): elements/bootstrap/build.yml

variables:
  builddir: ''
  prefix: '%{tools}'
  conf-link-args: |
    --disable-shared \
    --disable-static

  conf-local: |
    --without-lua \
    --with-external-db \
    --with-crypto=openssl \
    --without-archive \
    CPPFLAGS="-I%{tools}/include ${CPPFLAGS}" \
    LDFLAGS="-L%{tools}/lib ${LDFLAGS}"

config:
  configure-commands:
    (<):
    - |
      autoreconf -f -v -i

  build-commands:
  - |
    make include/rpm/argv.h
    make include/rpm/rpmbase64.h
    make include/rpm/rpmfileutil.h
    make include/rpm/rpmio.h
    make include/rpm/rpmkeyring.h
    make include/rpm/rpmlog.h
    make include/rpm/rpmmacro.h
    make include/rpm/rpmpgp.h
    make include/rpm/rpmsq.h
    make include/rpm/rpmstring.h
    make include/rpm/rpmstrpool.h
    make include/rpm/rpmsw.h
    make include/rpm/rpmurl.h
    make include/rpm/rpmutil.h
    make include/rpm/rpmtypes.h
    make include/rpm/rpmtag.h
    make -C misc libmisc.la
    make -C rpmio librpmio.la
    make debugedit

  install-commands:
  - |
    make -j1 install-rpmlibexecPROGRAMS DESTDIR="%{install-root}" rpmlibexec_PROGRAMS="debugedit" rpmlibexecdir="%{bindir}"

  - |
    %{delete_libtool_files}

sources:
- kind: tar
  url: tar_http:ftp.rpm.org/releases/rpm-4.14.x/rpm-4.14.1.tar.bz2
  ref: 43f40e2ccc3ca65bd3238f8c9f8399d4957be0878c2e83cba2746d2d0d96793b
- kind: patch
  path: patches/debugedit/debugedit-disable-berkdb-check.patch
- kind: patch
  path: patches/debugedit/debugedit-disable-md2.patch
