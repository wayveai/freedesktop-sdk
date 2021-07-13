kind: import

runtime-depends:
- bootstrap/build/base-sdk.bst

sources:
- kind: tar
  url: google:go/go1.16.6.linux-ppc64le.tar.gz
  directory: /usr/local/go
  ref: 62b5e9bb9440b7166241e5b7d5f49c7372b36429c8308a8456ee46fc1397a0fe
