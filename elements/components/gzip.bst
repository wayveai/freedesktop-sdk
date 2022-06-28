kind: autotools
description: GNU zip

depends:
- bootstrap-import.bst

(?):
- target_arch == "i686":
    variables:
      conf-local: TIME_T_32_BIT_OK=yes

sources:
- kind: tar
  url: ftp_gnu_org:gzip/gzip-1.12.tar.xz
  ref: ce5e03e519f637e1f814011ace35c4f87b33c0bbabeec35baf5fbd3479e91956
