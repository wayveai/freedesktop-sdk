kind: stack

depends:
- bootstrap-import.bst
- base/m4.bst
- base/buildsystem-autotools.bst
- base/gettext.bst
- base/bison.bst
- base/tar.bst
- base/gzip.bst # Needed by glibc-stage1-bst
- base/openssl.bst # Needed by debugedit-build.bst
- base/texinfo.bst # Needed by make.bst
- base/flex.bst # Needed by binutils-stage1-bst
- base/python3.bst # Neededs by glibc
