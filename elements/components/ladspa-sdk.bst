kind: make

depends:
- filename: bootstrap-import.bst

variables:
  install-conf: |
    INSTALL_PLUGINS_DIR=%{install-root}%{libdir}/ladspa \
    INSTALL_INCLUDE_DIR=%{install-root}%{includedir} \
    INSTALL_BINARY_DIR=%{install-root}%{bindir}

  make: |
    make PREFIX="%{prefix}" CFLAGS="-I. ${CFLAGS} ${LDFLAGS} -DDEFAULT_LADSPA_PATH=%{install-root}%{libdir}/ladspa"

config:
  build-commands:
    - |
      cd src
      %{make} targets

  install-commands:
    - |
      cd src
      %{make-install} %{install-conf}

sources:
- kind: tar
  url: tar_http:www.ladspa.org/download/ladspa_sdk_1.15.tgz
  ref: 4229959b09d20c88c8c86f4aa76427843011705df22d9c28b38359fd1829fded
