kind: autotools

depends:
- filename: bootstrap-import.bst

variables:
  builddir: ''

sources:
- kind: git_tag
  url: github:vim/vim.git
  track: v8.1.0266
  ref: v8.1.0266-0-gee8415bc5998792fab6f4dcf289d027856e05b89
