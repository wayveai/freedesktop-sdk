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
  url: ftp_gnu_org:findutils/findutils-4.9.0.tar.xz
  ref: a2bfb8c09d436770edc59f50fa483e785b161a3b7b9d547573cb08065fd462fe
