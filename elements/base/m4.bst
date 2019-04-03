kind: autotools
description: GNU m4

depends:
- filename: bootstrap-import.bst

sources:
- kind: tar
  url: ftp_gnu_org:m4/m4-1.4.18.tar.xz
  ref: f2c1e86ca0a404ff281631bdc8377638992744b175afb806e25871a24a934e07
- kind: patch
  path: patches/m4/m4-1.4.18-glibc-change-work-around.patch
