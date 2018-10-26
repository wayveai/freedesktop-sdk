kind: autotools

depends:
- filename: bootstrap-import.bst

variables:
  conf-local: |
    --without-selinux

public:
  bst:
    overlap-whitelist:
    - '**'

sources:
- kind: tar
  url: https://github.com/shadow-maint/shadow/releases/download/4.6/shadow-4.6.tar.xz
  ref: 0998c8d84242a231ab0acb7f8613927ff5bcff095f8aa6b79478893a03f05583
