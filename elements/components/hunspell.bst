kind: autotools

depends:
- filename: bootstrap-import.bst

variables:
  conf-local: |
    --with-readline \
    --with-ui

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libhunspell-1.3.so'

sources:
- kind: tar
  url: sourceforge_download:hunspell/hunspell-1.3.3.tar.gz
  ref: a7b2c0de0e2ce17426821dc1ac8eb115029959b3ada9d80a81739fa19373246c
