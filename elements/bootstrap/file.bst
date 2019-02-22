kind: autotools

depends:
- filename: bootstrap/file-build-deps.bst
  type: build
- filename: bootstrap/zlib.bst
  type: runtime

(@): elements/bootstrap/target.yml

config:
  configure-commands:
    (<):
      - autoreconf -ivf

  install-commands:
    (>):
    # Remove empty directory triggering BuildStream #647
    - |
      rm -rf "%{install-root}%{mandir}/man5"

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libmagic.so'

sources:
- kind: git_tag
  url: github:file/file
  track: master
  ref: FILE5_35-0-gd1ff3af7a2c6b38bdbdde7af26b59e3c50a48fff
