kind: autotools
description: GNU nano

depends:
  - filename: bootstrap-import.bst
    type: build

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
    url: http://ftp.gnu.org/gnu/nano/nano-2.8.7.tar.xz
    ref: fbe31746958698d73c6726ee48ad8b0612697157961a2e9aaa83b4aa53d1165a
