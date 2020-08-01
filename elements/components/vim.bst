kind: autotools

depends:
- bootstrap-import.bst

variables:
  builddir: ''

sources:
- kind: git_tag
  url: github:vim/vim.git
  track: master
  ref: v8.2.1333-0-gaf8edbb8dc551aaf2105a4d77b3d8495da239ef0
