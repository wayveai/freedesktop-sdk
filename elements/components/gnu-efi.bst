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
  ref: 3.0.11-0-g2ab1abfd26ea0a87a4fdf3d3c532544a65ae6954
