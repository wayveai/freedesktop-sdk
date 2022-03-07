kind: autotools

depends:
- bootstrap-import.bst

variables:
  build-dir: ''

sources:
- kind: git_tag
  url: github:vim/vim.git
  track: master
  ref: v8.2.2683-0-gb91d3f857fb6aadbbc01f80f775967bb40d361de
