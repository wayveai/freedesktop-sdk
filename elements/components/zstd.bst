kind: make

depends:
- bootstrap-import.bst

variables:
  make-args: >-
    PREFIX="%{prefix}"
    LIBDIR="%{libdir}"
  make: make %{make-args}
  make-install: make -j1 install DESTDIR="%{install-root}" %{make-args}

config:
  install-commands:
    (>):
    - |
      rm -f '%{install-root}%{libdir}'/*.a

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libzstd.so'

sources:
- kind: git_tag
  url: github:facebook/zstd.git
  track: release
  ref: v1.5.2-0-ge47e674cd09583ff0503f0f6defd6d23d8b718d3
