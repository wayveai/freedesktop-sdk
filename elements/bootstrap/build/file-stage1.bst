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
  url: github:file/file
  track: master
  ref: FILE5_35-0-gd1ff3af7a2c6b38bdbdde7af26b59e3c50a48fff
