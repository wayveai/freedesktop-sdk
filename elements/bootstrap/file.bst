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

  cpe:
    version: '5.36'

sources:
- kind: git_tag
  url: github:file/file.git
  track: master
  ref: FILE5_36-0-gf3a4b9ada3ca99e62c62b9aa78eee4935a8094fe
