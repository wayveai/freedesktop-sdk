kind: import

runtime-depends:
- bootstrap/build/base-sdk.bst

sources:
- kind: tar
  url: google:go/go1.16.3.linux-ppc64le.tar.gz
  directory: /usr/local/go
  ref: 5eb046bbbbc7fe2591846a4303884cb5a01abb903e3e61e33459affe7874e811
