kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: base/autoconf.bst
  type: build
- filename: base/automake.bst
  type: build
- filename: base/flex.bst
  type: build
- filename: base/bison.bst
  type: build

variables:
  conf-local: |
    --enable-maintainer-mode

sources:
- kind: git
  url: git://sourceware.org/git/elfutils.git
  track: elfutils-0.172
  ref: 1553166973aad9501a3b90fb3dfbabf213fad19c
