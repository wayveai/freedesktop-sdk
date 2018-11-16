kind: autotools

depends:
- bootstrap-import.bst

sources:
- kind: git_tag
  url: https://sourceware.org/git/lvm2.git
  track: master
  ref: ea6a8078b41df75344aecff4c54aab9c78b67193 #v2_02_98
