kind: import

runtime-depends:
- bootstrap/build/base-sdk.bst

sources:
- kind: tar
  url: google:go/go1.15.8.linux-amd64.tar.gz
  directory: /usr/local/go
  ref: d3379c32a90fdf9382166f8f48034c459a8cc433730bc9476d39d9082c94583b
