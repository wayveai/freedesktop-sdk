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
  url: https://git.code.sf.net/p/gnu-efi/code
  track: master
  ref: 3.0.10-0-g9b14e7dab0abf0ef062db60666b677b33e10c627
