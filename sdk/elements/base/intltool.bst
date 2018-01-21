kind: autotools

depends:
  - filename: bootstrap-import.bst
    type: build
  - filename: base/perl.bst
  - filename: base/perl-xml-parser.bst

sources:
  - kind: tar
    url: https://launchpad.net/intltool/trunk/0.51.0/+download/intltool-0.51.0.tar.gz
    ref: 67c74d94196b153b774ab9f89b2fa6c6ba79352407037c8c14d5aeb334e959cd
  - kind: patch
    path: elements/base/intltool-perl-5.22-compatibility.patch
