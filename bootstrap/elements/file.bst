kind: autotools

depends:
- filename: file-build-deps.bst
  type: build
- filename: zlib.bst
  type: runtime

(@): target.yml

config:
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
- kind: tar
  url: ftp://ftp.astron.com/pub/file/file-5.35.tar.gz
  ref: 30c45e817440779be7aac523a905b123cba2a6ed0bf4f5439e1e99ba940b5546
