kind: manual

depends:
  - filename: bootstrap-import.bst

config:
  build-commands:
    - |
      make -f Makefile-libbz2_so
    - |
      make bzip2recover

  install-commands:
    - |
      install -D -m 755 libbz2.so.1.0.6 --target-directory %{install-root}%{libdir}
      ln -s libbz2.so.1.0.6 %{install-root}%{libdir}/libbz2.so.1.0
      ln -s libbz2.so.1.0.6 %{install-root}%{libdir}/libbz2.so
      install -D -m 755 bzip2-shared %{install-root}%{bindir}/bzip2
      ln -s bzip2 %{install-root}%{bindir}/bzcat
      ln -s bzip2 %{install-root}%{bindir}/bunzip2
      install -D -m 755 bzip2recover --target-directory %{install-root}%{bindir}
      install -D -m 755 bzmore --target-directory %{install-root}%{bindir}
      ln -s bzmore %{install-root}%{bindir}/bzfless
      install -D -m 755 bzgrep --target-directory %{install-root}%{bindir}
      ln -s bzgrep %{install-root}%{bindir}/bzegrep
      ln -s bzgrep %{install-root}%{bindir}/bzfgrep
      install -D -m 755 bzdiff --target-directory %{install-root}%{bindir}
      ln -s bzdiff %{install-root}%{bindir}/bzcmp
      install -D -m 755 bzlib.h --target-directory %{install-root}%{includedir}
      install -D -m 755 bzgrep.1 bzmore.1 bzdiff.1 --target-directory %{install-root}%{mandir}/man1

sources:
  - kind: tar
    url: http://bzip.org/1.0.6/bzip2-1.0.6.tar.gz
    ref: a2848f34fcd5d6cf47def00461fcb528a0484d8edef8208d6d2e2909dc61d9cd
