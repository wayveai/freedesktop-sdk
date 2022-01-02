kind: stack

depends:
- bootstrap-import.bst
- components/m4.bst
- public-stacks/buildsystem-autotools.bst
- components/gettext.bst
- components/bison.bst
- components/tar.bst
- components/gzip.bst # Needed by glibc-stage1-bst
- components/texinfo.bst # Needed by make.bst
- components/flex.bst # Needed by binutils-stage1-bst
