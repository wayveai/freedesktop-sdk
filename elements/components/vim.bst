kind: autotools

depends:
- bootstrap-import.bst

variables:
  builddir: ''

sources:
- kind: git_tag
  url: github:vim/vim.git
  track: master
  ref: v8.2.1313-0-gb5ed266037dea49024e00c4e1f9c89f3a9ebaa60
