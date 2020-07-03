kind: make

depends:
- bootstrap-import.bst

variables:
  make-args: >-
    PREFIX='%{prefix}'
    EXEC_PREFIX='%{exec_prefix}'
    LIBDIR='%{libdir}'
    MANDIR='%{mandir}'
    INCLUDEDIR='%{includedir}'
    BINDIR='%{bindir}'

  make: make %{make-args}
  make-install: make -j1 DESTDIR='%{install-root}' %{make-args} install

sources:
- kind: git_tag
  url: github:rhboot/efivar.git
  track: master
  ref: 37-0-gc1d6b10e1ed4ba2be07f385eae5bceb694478a10
- kind: patch
  path: patches/efivar/no-werror.patch
