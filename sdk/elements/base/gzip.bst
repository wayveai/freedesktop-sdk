kind: autotools
description: GNU zip

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
    url: http://ftp.gnu.org/gnu/gzip/gzip-1.8.tar.xz
    ref: ff1767ec444f71e5daf8972f6f8bf68cfcca1d2f76c248eb18e8741fc91dbbd3
