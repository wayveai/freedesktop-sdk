kind: autotools

depends:
- bootstrap-import.bst

variables:
  builddir: ''

sources:
- kind: git_tag
  url: github:vim/vim.git
  track: master
  ref: v8.2.1303-0-g6d585f4c5c8d120f768dd61bfd32f6e57ad562a7
