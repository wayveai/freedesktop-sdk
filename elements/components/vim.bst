kind: autotools

depends:
- bootstrap-import.bst

variables:
  builddir: ''

sources:
- kind: git_tag
  url: github:vim/vim.git
  track: master
  ref: v8.2.1352-0-gad486a0f0dd194826fdb733516bf0f35382c9dd7
