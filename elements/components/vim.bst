kind: autotools

depends:
- bootstrap-import.bst

variables:
  builddir: ''

sources:
- kind: git_tag
  url: github:vim/vim.git
  track: master
  ref: v8.2.2673-0-g3215466af9abfc9fbbfba81d166d625176993486
