kind: myautotools
description: Glib

depends:
  - filename: bootstrap-import.bst
  - filename: base/zlib.bst
  - filename: base/libffi.bst
  - filename: base/gettext.bst
    type: build
  - filename: base/util-linux.bst
    type: build
  - filename: base/pcre.bst
  - filename: base/python2.bst
    type: build
  - filename: base/pkg-config-stage1.bst
    type: build

variables:
  conf-extra:
    --with-pcre=system

sources:
  - kind: tar
    url: https://download.gnome.org/sources/glib/2.54/glib-2.54.1.tar.xz
    ref: 50c01b1419324f10fbf9b9709ec2164b18586968bdce7540583bf32302cf47a3
