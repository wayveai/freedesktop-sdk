kind: manual

depends:
- bootstrap-import.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/liblz4.so'

sources:
- kind: git_tag
  url: github:lz4/lz4.git
  track: master
  ref: v1.9.2-0-gfdf2ef5809ca875c454510610764d9125ef2ebbd

config:

  build-commands:
  - make CFLAGS="${CFLAGS}" BUILD_STATIC=no

  install-commands:
  - make DESTDIR="%{install-root}" PREFIX="%{prefix}" LIBDIR="%{libdir}" BUILD_STATIC=no install

