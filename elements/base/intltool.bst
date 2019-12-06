kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: base/perl.bst
- filename: base/perl-xml-parser.bst
- filename: base/gettext.bst
  type: runtime

sources:
- kind: tar
  url: tar_https:launchpad.net/intltool/trunk/0.51.0/+download/intltool-0.51.0.tar.gz
  ref: 67c74d94196b153b774ab9f89b2fa6c6ba79352407037c8c14d5aeb334e959cd
- kind: patch
  path: patches/intltool/intltool-perl-5.22-compatibility.patch
