kind: autotools
description: GNU findutils

depends:
- filename: bootstrap/findutils-build-deps.bst
  type: build
- filename: bootstrap/glibc.bst
  type: runtime

(@): elements/bootstrap/include/target.yml

config:
  install-commands:
    (>):
    - |
      rm "%{install-root}%{infodir}/dir"

sources:
- kind: tar
  url: ftp_gnu_org:findutils/findutils-4.8.0.tar.xz
  ref: 57127b7e97d91282c6ace556378d5455a9509898297e46e10443016ea1387164
