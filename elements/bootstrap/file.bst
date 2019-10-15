kind: autotools

depends:
- filename: bootstrap/file-build-deps.bst
  type: build
- filename: bootstrap/zlib.bst
  type: runtime

(@): elements/bootstrap/include/target.yml

variables:
  conf-local: |
   --disable-libseccomp

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
    version-match: '(\d+)_(\d+)'

sources:
- kind: git_tag
  url: github:file/file
  track: master
  ref: FILE5_37-0-ga0d5b0e4e9f97d74a9911e95cedd579852e25398
