kind: autotools
description: GNU sed

depends:
- filename: bootstrap/sed-build-deps.bst
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
  url: ftp_gnu_org:sed/sed-4.8.tar.xz
  ref: f79b0cfea71b37a8eeec8490db6c5f7ae7719c35587f21edb0617f370eeff633
