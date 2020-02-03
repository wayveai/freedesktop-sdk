kind: autotools

depends:
- filename: bootstrap/file-build-deps.bst
  type: build
- filename: bootstrap/zlib.bst
  type: runtime

(@):
- elements/bootstrap/include/target.yml
- elements/bootstrap/include/file-source.yml

variables:
  conf-local: >-
   --disable-libseccomp
   --disable-xzlib
   --disable-bzlib

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
