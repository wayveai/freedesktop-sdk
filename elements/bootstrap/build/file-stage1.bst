kind: autotools

depends:
- filename: bootstrap/build/base-sdk.bst
  type: build
- filename: bootstrap/gnu-config.bst
  type: build
- filename: bootstrap/build/tools-lib-path.bst
  type: runtime

(@): elements/bootstrap/build.yml

variables:
  prefix: '%{tools}'
  lib: lib

config:
  configure-commands:
    (<):
      - autoreconf -ivf

sources:
- kind: git_tag
  url: github:file/file.git
  track: master
  ref: FILE5_36-0-gf3a4b9ada3ca99e62c62b9aa78eee4935a8094fe
