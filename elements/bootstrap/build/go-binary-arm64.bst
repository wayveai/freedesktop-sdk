kind: import

runtime-depends:
- bootstrap/build/base-sdk.bst

sources:
- kind: tar
  url: google:go/go1.15.8.linux-arm64.tar.gz
  directory: /usr/local/go
  ref: 0e31ea4bf53496b0f0809730520dee98c0ae5c530f3701a19df0ba0a327bf3d2
