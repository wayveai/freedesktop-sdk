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
  ref: v1.4.5-0-gb706286adbba780006a47ef92df0ad7a785666b6
