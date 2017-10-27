kind: autotools
description: GNU m4

depends:
  - filename: bootstrap-import.bst

variables:
  conf-extra: |
    --host=%{triple} \
    --build=%{triple}

config:
  configure-commands:
    - |
      %{configure}

sources:
  - kind: tar
    url: http://ftp.gnu.org/gnu/m4/m4-1.4.18.tar.xz
    ref: f2c1e86ca0a404ff281631bdc8377638992744b175afb806e25871a24a934e07
