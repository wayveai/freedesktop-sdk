kind: import

runtime-depends:
- bootstrap/build/base-sdk.bst

sources:
- kind: tar
  url: google:go/go1.16.3.linux-arm64.tar.gz
  directory: /usr/local/go
  ref: 566b1d6f17d2bc4ad5f81486f0df44f3088c3ed47a3bec4099d8ed9939e90d5d
