kind: autotools

depends:
- filename: bootstrap-import.bst

environment:
  FORCE_UNSAFE_CONFIGURE: 1

sources:
- kind: tar
  url: ftp_gnu_org:tar/tar-1.31.tar.xz
  ref: 37f3ef1ceebd8b7e1ebf5b8cc6c65bb8ebf002c7d049032bf456860f25ec2dc1
