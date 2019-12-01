kind: autotools

depends:
- filename: bootstrap/build/base-sdk.bst
  type: build
- filename: bootstrap/gnu-config.bst
  type: build
- filename: bootstrap/build/tools-lib-path.bst
  type: runtime

(@): elements/bootstrap/include/build.yml

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
  ref: FILE5_37-0-ga0d5b0e4e9f97d74a9911e95cedd579852e25398
