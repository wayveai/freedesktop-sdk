kind: manual

depends:
- filename: dependencies/base-sdk.bst
  type: build
- filename: gnu-config.bst
  type: build
- filename: linux-headers.bst
  type: build
- filename: gcc-stage2.bst
  type: build
- filename: binutils-stage1.bst
  type: build
- filename: glibc.bst
  type: build
- filename: cross-installation-links.bst
  type: build
- filename: debugedit-host.bst
  type: build

config:
  build-commands:
  - |
    make -f Makefile-libbz2_so CC="%{triplet}-gcc" CFLAGS="-fpic -fPIC -Wall -Winline $CFLAGS -D_FILE_OFFSET_BITS=64"
  - |
    make bzip2recover CC="%{triplet}-gcc" AR="%{triplet}-ar" RANLIB="%{triplet}-ranlib" CFLAGS="-Wall -Winline $CFLAGS -D_FILE_OFFSET_BITS=64" LDFLAGS="$LDFLAGS"

  install-commands:
  - |
    install -D -m 755 libbz2.so.1.0.6 --target-directory %{install-root}%{sysroot}%{libdir}
    ln -s libbz2.so.1.0.6 %{install-root}%{sysroot}%{libdir}/libbz2.so.1.0
    ln -s libbz2.so.1.0.6 %{install-root}%{sysroot}%{libdir}/libbz2.so
    install -D -m 755 bzip2-shared %{install-root}%{sysroot}%{bindir}/bzip2
    ln -s bzip2 %{install-root}%{sysroot}%{bindir}/bzcat
    ln -s bzip2 %{install-root}%{sysroot}%{bindir}/bunzip2
    install -D -m 755 bzip2recover --target-directory %{install-root}%{sysroot}%{bindir}
    install -D -m 755 bzmore --target-directory %{install-root}%{sysroot}%{bindir}
    ln -s bzmore %{install-root}%{sysroot}%{bindir}/bzfless
    install -D -m 755 bzgrep --target-directory %{install-root}%{sysroot}%{bindir}
    ln -s bzgrep %{install-root}%{sysroot}%{bindir}/bzegrep
    ln -s bzgrep %{install-root}%{sysroot}%{bindir}/bzfgrep
    install -D -m 755 bzdiff --target-directory %{install-root}%{sysroot}%{bindir}
    ln -s bzdiff %{install-root}%{sysroot}%{bindir}/bzcmp
    install -D -m 755 bzlib.h --target-directory %{install-root}%{sysroot}%{includedir}
    install -D -m 755 bzgrep.1 bzmore.1 bzdiff.1 --target-directory %{install-root}%{sysroot}%{mandir}/man1

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{sysroot}%{libdir}/libbz2.so'

sources:
- kind: tar
  url: https://download.gnome.org/teams/releng/tarballs-needing-help/bzip2/bzip2-1.0.6.tar.gz
  ref: a2848f34fcd5d6cf47def00461fcb528a0484d8edef8208d6d2e2909dc61d9cd
