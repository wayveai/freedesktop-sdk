kind: autotools
description: GNU autoconf archive

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
    url: http://ftp.gnu.org/gnu/autoconf-archive/autoconf-archive-2017.09.28.tar.xz
    ref: 5c9fb5845b38b28982a3ef12836f76b35f46799ef4a2e46b48e2bd3c6182fa01
