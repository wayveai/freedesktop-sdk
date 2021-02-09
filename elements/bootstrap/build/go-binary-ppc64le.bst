kind: import

runtime-depends:
- bootstrap/build/base-sdk.bst

sources:
- kind: tar
  url: google:go/go1.15.8.linux-ppc64le.tar.gz
  directory: /usr/local/go
  ref: c6ddeab22b23ee33f5e8f06f9667e2092f48dbc6d5db553a66f7fe21da73fbfa
