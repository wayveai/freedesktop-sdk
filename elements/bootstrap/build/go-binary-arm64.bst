kind: import

runtime-depends:
- bootstrap/build/base-sdk.bst

sources:
- kind: tar
  url: google:go/go1.16.6.linux-arm64.tar.gz
  directory: /usr/local/go
  ref: 9e38047463da6daecab9017cd0599f33f84991e68263752cfab49253bbc98c30
