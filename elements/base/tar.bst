kind: autotools

depends:
- filename: bootstrap-import.bst

environment:
  FORCE_UNSAFE_CONFIGURE: 1

sources:
- kind: tar
  url: ftp_gnu_org:tar/tar-1.30.tar.xz
  ref: f1bf92dbb1e1ab27911a861ea8dde8208ee774866c46c0bb6ead41f4d1f4d2d3
