kind: autotools

depends:
- bootstrap-import.bst
- components/util-linux.bst

runtime-depends:
- components/libxslt.bst

sources:
- kind: tar
  url: pagure_releases:xmlto/xmlto-0.0.28.tar.bz2
  ref: 1130df3a7957eb9f6f0d29e4aa1c75732a7dfb6d639be013859b5c7ec5421276
