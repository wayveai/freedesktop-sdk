kind: autotools
description: GNU diffutils

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
    url: http://ftp.gnu.org/gnu/diffutils/diffutils-3.6.tar.xz
    ref: d621e8bdd4b573918c8145f7ae61817d1be9deb4c8d2328a65cea8e11d783bd6
