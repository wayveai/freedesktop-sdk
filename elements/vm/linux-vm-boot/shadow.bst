kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: components/linux-pam.bst

variables:
  conf-local: >-
    --with-libpam
    --without-selinux

  make-install: make -j1 install DESTDIR="%{install-root}" ubindir="%{bindir}" usbindir="%{sbindir}"

config:
  install-commands:
    (>):
    - |
      # remove pam_selinux and pam_console from the config
      # as we don't build them
      sed -i /pam_selinux/d %{install-root}%{sysconfdir}/pam.d/*
      sed -i /pam_console/d %{install-root}%{sysconfdir}/pam.d/*

sources:
- kind: tar
  url: github:shadow-maint/shadow/releases/download/4.7/shadow-4.7.tar.xz
  ref: e5e196a4a7e3b228c812f3163d368be3e932e6eaa4e616677a148d9ec921e16c
