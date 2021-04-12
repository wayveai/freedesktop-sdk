kind: import

runtime-depends:
- bootstrap/build/base-sdk.bst

sources:
- kind: tar
  url: google:go/go1.16.3.linux-amd64.tar.gz
  directory: /usr/local/go
  ref: 951a3c7c6ce4e56ad883f97d9db74d3d6d80d5fec77455c6ada6c1f7ac4776d2
