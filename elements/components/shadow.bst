kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/libxslt.bst
- components/docbook-xsl.bst
- components/bison.bst
- components/itstool.bst

depends:
- bootstrap-import.bst
- components/linux-pam.bst

variables:
  builddir: ''
  autogen: autoreconf -fvi
  conf-local: >-
    --with-libpam
    --without-selinux
    --enable-man

  make-install: make -j1 install DESTDIR="%{install-root}" ubindir="%{bindir}" usbindir="%{sbindir}"

config:
  install-commands:
    (>):
    - |
      # remove pam_selinux and pam_console from the config
      # as we don't build them
      sed -i /pam_selinux/d %{install-root}%{sysconfdir}/pam.d/*
      sed -i /pam_console/d %{install-root}%{sysconfdir}/pam.d/*

    - rm "%{install-root}/etc/default/useradd"

public:
  initial-script:
    script: |
      #!/bin/bash
      sysroot="${1}"
      for i in su passwd gpasswd chsh chfn newgrp; do
        chmod 4755 "${sysroot}%{bindir}/${i}"
      done
      for i in expiry chage; do
        chmod 4755 "${sysroot}%{bindir}/${i}"
      done

sources:
- kind: git_tag
  url: github:shadow-maint/shadow.git
  track: master
  ref: 4.8.1-0-g2cc7da6058152ec0cd338d4e15d29bd7124ae3d7
