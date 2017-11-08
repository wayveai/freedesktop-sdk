kind: myautotools

depends:
  - filename: base-stack.bst
    type: build

variables:
  conf-link-args: ''
  conf-extra: |
    --disable-documentation

config:
  build-commands:
    - |
      cd "%{builddir}"
      %{make} SUBDIRS=po

  install-commands:
    - |
      cd "%{builddir}"
      %{make-install} SUBDIRS=po

sources:
  - kind: tar
    url: https://user-dirs.freedesktop.org/releases/xdg-user-dirs-0.16.tar.gz
    ref: 770fb42c8809d192c661585a0ee9ed9b65ebaca7532abe7dd68eca0e4962e3e6

