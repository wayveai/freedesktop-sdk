kind: myautotools
description: GNU nano

depends:
  - filename: bootstrap-import.bst
    type: build
  - filename: base/pkg-config.bst

sources:
  - kind: tar
    url: http://ftp.gnu.org/gnu/nano/nano-2.8.7.tar.xz
    ref: fbe31746958698d73c6726ee48ad8b0612697157961a2e9aaa83b4aa53d1165a
