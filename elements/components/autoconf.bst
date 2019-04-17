kind: autotools
description: GNU autoconf

depends:
- filename: bootstrap-import.bst
- filename: components/m4.bst
- filename: components/perl.bst

sources:
- kind: tar
  url: ftp_gnu_org:autoconf/autoconf-2.69.tar.xz
  ref: 64ebcec9f8ac5b2487125a86a7760d2591ac9e1d3dbd59489633f9de62a57684
