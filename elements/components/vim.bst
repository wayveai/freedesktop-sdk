kind: autotools

depends:
- bootstrap-import.bst

variables:
  builddir: ''

sources:
- kind: git_tag
  url: github:vim/vim.git
  track: master
  ref: v8.2.1307-0-g0aac67a4314d72a29d3fbee91b6f0ba89e950462
