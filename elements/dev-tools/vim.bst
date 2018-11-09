kind: autotools

depends:
- filename: bootstrap-import.bst

variables:
  builddir: ''

sources:
- kind: git_tag
  url: github:vim/vim
  track: v8.1.0266
  ref: ee8415bc5998792fab6f4dcf289d027856e05b89 # v8.1.0266
