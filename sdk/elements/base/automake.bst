kind: autotools
description: GNU automake

depends:
  - filename: bootstrap-import.bst
    type: build
  - filename: base/autoconf.bst

sources:
  - kind: tar
    url: http://ftp.gnu.org/gnu/automake/automake-1.15.1.tar.xz
    ref: af6ba39142220687c500f79b4aa2f181d9b24e4f8d8ec497cea4ba26c64bedaf
