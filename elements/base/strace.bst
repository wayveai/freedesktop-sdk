kind: autotools

depends:
  - filename: bootstrap-import.bst

variables:
  conf-local: "--enable-mpers=check"

sources:
  - kind: tar
    url: https://github.com/strace/strace/releases/download/v4.23/strace-4.23.tar.xz
    ref: 7860a6965f1dd832747bd8281a04738274398d32c56e9fbd0a68b1bb9ec09aad
