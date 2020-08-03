kind: autotools

depends:
- bootstrap-import.bst

variables:
  builddir: ''

sources:
- kind: git_tag
  url: github:vim/vim.git
  track: master
  ref: v8.2.1359-0-g83144546488b544a1fe4e2a4f8be954b98c696fc
