kind: autotools
description: GNU automake

build-depends:
- components/help2man.bst

depends:
- bootstrap-import.bst
- components/autoconf.bst

sources:
- kind: tar
  url: ftp_gnu_org:automake/automake-1.16.4.tar.xz
  ref: 80facc09885a57e6d49d06972c0ae1089c5fa8f4d4c7cfe5baea58e5085f136d
