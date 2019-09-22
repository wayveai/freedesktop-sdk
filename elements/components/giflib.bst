kind: manual

depends:
- filename: bootstrap-import.bst

variables:
  config: >-
    PREFIX="%{prefix}"
    LIBDIR="%{libdir}"
    BINDIR="%{bindir}"
    INCDIR="%{includedir}"
    MANDIR="%{mandir}"

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libgif.so'

config:
  build-commands:
  - |
    make %{config}

  install-commands:
  - |
    make install %{config} DESTDIR="%{install-root}"

  - |
    rm "%{install-root}%{libdir}/libgif.a"

sources:
- kind: tar
  url: sourceforge_download:giflib/giflib-5.2.1.tar.gz
  ref: 31da5562f44c5f15d63340a09a4fd62b48c45620cd302f77a6d9acf0077879bd
