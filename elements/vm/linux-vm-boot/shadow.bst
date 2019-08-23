kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: components/linux-pam.bst

variables:
  conf-local: |
    --with-libpam \
    --without-selinux

config:
  install-commands:
  - |
    cd %{builddir}
    %{make-install} ubindir="%{bindir}" usbindir="%{sbindir}"
  - |
    %{delete_libtool_files}
  - |
    # remove pam_selinux and pam_console from the config
    # as we don't build them
    sed -i /pam_selinux/d %{install-root}%{sysconfdir}/pam.d/*
    sed -i /pam_console/d %{install-root}%{sysconfdir}/pam.d/*


public:
  bst:
    overlap-whitelist:
    - '**'

sources:
- kind: tar
  url: github:shadow-maint/shadow/releases/download/4.6/shadow-4.6.tar.xz
  ref: 0998c8d84242a231ab0acb7f8613927ff5bcff095f8aa6b79478893a03f05583
