kind: manual

depends:
  - filename: bootstrap-import.bst
    type: build

variables:
  make-args: |
    TOPDIR="%{prefix}" \
    MANDIR="%{mandir}" \
    TZDIR="%{datadir}/zoneinfo"

config:
  build-commands:
    - |
      make %{make-args}

  install-commands:
    - |
      make %{make-args} -j1 DESTDIR="%{install-root}" install

    # Man pages are provided by Linux's man-pages
    # sdk/elements/base/man-pages.bst
    - |
      rm -rf "%{install-root}%{mandir}"

sources:
  - kind: tar
    url: ftp://ftp.iana.org/tz/releases/tzdata2017c.tar.gz
    ref: d6543f92a929826318e2f44ff3a7611ce5f565a43e10250b42599d0ba4cbd90b
    base-dir: ''
  - kind: tar
    url: ftp://ftp.iana.org/tz/releases/tzcode2017c.tar.gz
    ref: 81e8b4bc23e60906640c266bbff3789661e22f0fa29fe61b96ec7c2816c079b7
    base-dir: ''
