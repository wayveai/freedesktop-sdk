kind: manual

depends:
- filename: bootstrap-import.bst

variables:
  make-args: |
    INSTALLROOT='%{install-root}' \
    LIBDIR='%{libdir}' \
    PREFIX='%{prefix}'

config:
  build-commands:
  - |
    make %{make-args}

  install-commands:
  - |
    make -j1 %{make-args} install

sources:
- kind: git_tag
  url: sourceforge_git:gnu-efi/code.git
  track: master
  ref: 3.0.13-0-g59fd1e9d1d75cedfa9c1f6a06fd3f367fe644360
- kind: patch
  path: patches/gnu-efi/gnu-efi-riscv.patch
