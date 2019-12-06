kind: autotools

depends:
- filename: bootstrap-import.bst

variables:
  conf-link-args: ''
  conf-local: |
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
  url: tar_https:user-dirs.freedesktop.org/releases/xdg-user-dirs-0.17.tar.gz
  ref: 2a07052823788e8614925c5a19ef5b968d8db734fdee656699ea4f97d132418c
